//
//  HomeViewController.swift
//  AppBase
//
//  Created by Kuznetsov Mikhail on 21.12.2024.
//

import Foundation

protocol IHomeView: AnyObject {
    
    func configureBanner(_ viewModel: GoodsBannerViewModel)
    func configureCollection(userInfo: UserInfo, bonuses: [Bonus], goods: [Product])
}

final class HomeViewController: UIViewController {
    
    private let presenter: IHomePresenter
    private let productsCollectionAssembly: ProductsCollectionAssembly
    
    // UI
    private lazy var banner = presenter.makeBanner()
    private lazy var collection = productsCollectionAssembly.assemble()

    init(
        presenter: IHomePresenter,
        productsCollectionAssembly: ProductsCollectionAssembly
    ) {
        self.presenter = presenter
        self.productsCollectionAssembly = productsCollectionAssembly
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Т–Вкусно"
        setupUI()
        
        presenter.viewDidLoad()
    }
    
    private func setupUI() {
        addChild(collection)
        view.addSubview(collection.view)
        collection.didMove(toParent: self)
        collection.view.fillSuperview()
        collection.add(banner: banner)
    }
}

// MARK: - IHomeView

extension HomeViewController: IHomeView {
    
    func configureBanner(_ viewModel: GoodsBannerViewModel) {
        self.banner.configure(with: viewModel)
    }
    
    func configureCollection(userInfo: UserInfo, bonuses: [Bonus], goods: [Product]) {
        collection.configure(userInfo: userInfo, bonuses: bonuses, goods: goods)
    }
}


extension UIViewController {
    public func wrappedInNavigation() -> UINavigationController {
        let navigationController: UINavigationController
        navigationController = UINavigationController()
        navigationController.pushViewController(self, animated: false)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }
}
