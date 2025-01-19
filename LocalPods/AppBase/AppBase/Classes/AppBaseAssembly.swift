//
//  AppBaseAssembly.swift
//  AppBase
//
//  Created by Kuznetsov Mikhail on 20.02.2024.
//

import Foundation

public extension String {
    static let currentUserId = "user312"
}

public final class AppBaseAssembly {

    public static func homeController(
        goodsService: IGoodsService,
        goodsBannerService: IGoodsBannerService,
        userInfoService: IUserInfoService,
        bonusesService: IBonusesService,
        productViewFactory: IProductViewFactory,
        productButtonModelFactory: @escaping (String, ICartService) -> IButtonsViewInteractionModel,
        goodsBannerViewFactory: IGoodsBannerViewFactory,
        productsDataSource: IProductsDataSource,
        goodsBannerViewModelFactory: IGoodsBannerViewModelFactory,
        cartService: ICartService,
        cartHandler: @escaping () -> UIViewController
    )-> UIViewController {
        
        let presenter = HomePresenter(
            goodsBannerService: goodsBannerService,
            goodsService: goodsService,
            userInfoService: userInfoService,
            bonusesService: bonusesService,
            goodsBannerViewFactory: goodsBannerViewFactory,
            goodsBannerViewModelFactory: goodsBannerViewModelFactory
        )
        let productsCollectionAssembly = ProductsCollectionAssembly(
            productViewFactory: productViewFactory,
            productButtonModelFactory: productButtonModelFactory,
            productsDataSource: productsDataSource,
            cartService: cartService,
            cartHandler: cartHandler
        )
        let controller = HomeViewController(presenter: presenter, 
                                            productsCollectionAssembly: productsCollectionAssembly)
        
        presenter.view = controller
        
        return controller.wrappedInNavigation()
    }
    
    public static func cartController(presenter: ICartPresenter) -> UIViewController {
        CartViewController(presenter: presenter)
    }
    
    public static func paymentController(
        paymentPresenter: IPaymentPresenter,
        cardInputView: () -> ICardInputView
    ) -> UIViewController {
        let view = cardInputView()
        let viewController = PaymentViewController(presenter: paymentPresenter,
                                                   cardInputView: view)
        view.delegate = viewController
        paymentPresenter.view = viewController

        return viewController
    }
}
