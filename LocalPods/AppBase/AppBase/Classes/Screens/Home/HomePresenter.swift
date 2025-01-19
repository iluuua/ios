//
//  HomePresenter.swift
//  AppBase
//
//  Created by Kuznetsov Mikhail on 21.12.2024.
//

import Foundation

protocol IHomePresenter {
    func viewDidLoad()
    func makeBanner() -> IGoodsBannerView
}

final class HomePresenter {
   
    // Dependencies
    weak var view: IHomeView?
    private let goodsBannerService: IGoodsBannerService
    private let goodsService: IGoodsService
    private let userInfoService: IUserInfoService
    private let bonusesService: IBonusesService
    private let goodsBannerViewFactory: IGoodsBannerViewFactory
    private let goodsBannerViewModelFactory: IGoodsBannerViewModelFactory

    init(goodsBannerService: IGoodsBannerService,
         goodsService: IGoodsService,
         userInfoService: IUserInfoService,
         bonusesService: IBonusesService,
         goodsBannerViewFactory: IGoodsBannerViewFactory,
         goodsBannerViewModelFactory: IGoodsBannerViewModelFactory) {
        self.goodsBannerService = goodsBannerService
        self.goodsService = goodsService
        self.userInfoService = userInfoService
        self.bonusesService = bonusesService
        self.goodsBannerViewFactory = goodsBannerViewFactory
        self.goodsBannerViewModelFactory = goodsBannerViewModelFactory
    }
}

// MARK: - IHomePresenter

extension HomePresenter: IHomePresenter {

    func viewDidLoad() {
        let group = DispatchGroup()
        var userInfo: UserInfo?
        var goods = [Product]()
        var bonuses = [Bonus]()
        
        group.enter()
        userInfoService.loadUserInfo { result in
            switch result {
            case .success(let model):
                userInfo = model
            case .failure(let error):
                print("User info loading error", error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        goodsService.loadGoods { result in
            switch result {
            case .success(let models):
                goods = models
            case .failure(let error):
                print("Goods loading error", error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        bonusesService.loadBonuses { result in
            switch result {
            case .success(let models):
                bonuses = models
            case .failure(let error):
                print("Bonuses loading error", error.localizedDescription)
            }
            group.leave()
        }
        
        group.notify(queue: .main) { [weak self] in
            guard let self, let userInfo else { return }
            view?.configureCollection(userInfo: userInfo, bonuses: bonuses, goods: goods)
        }
        
        goodsBannerService.loadGoodsBanner { [weak self] result in
            guard let self else { return }
            switch result {
            case .success(let bannerInfo):
                DispatchQueue.main.async {
                    self.view?.configureBanner(self.goodsBannerViewModelFactory.makeViewModel(banner: bannerInfo))
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func makeBanner() -> IGoodsBannerView {
        goodsBannerViewFactory.makeGoodsBannerView()
    }
}
