//
//  ProductsCollectionPresenter.swift
//  Solution
//
//  Created by Alex Yatsenko on 22.12.2024.
//

protocol IProductsCollectionPresenter {
    var products: [(product: ProductViewModel, button: IButtonsViewInteractionModel)] { get }
    func updateData(userInfo: UserInfo, bonuses: [Bonus], goods: [Product])
    func makeView() -> IProductView
    func updateStateButton()
    func didTapPrimaryButton()
}

final class ProductsCollectionPresenter {
    
    private let productViewFactory: IProductViewFactory
    private let productButtonModelFactory: (String, ICartService) -> IButtonsViewInteractionModel
    private let productsDataSource: IProductsDataSource
    private let cartService: ICartService
    private let cartHandler: () -> UIViewController
    

    init(
        productViewFactory: IProductViewFactory,
        productButtonModelFactory: @escaping (String, ICartService) -> IButtonsViewInteractionModel,
        productsDataSource: IProductsDataSource,
        cartService: ICartService,
        cartHandler: @escaping () -> UIViewController
    ) {
        self.productViewFactory = productViewFactory
        self.productButtonModelFactory = productButtonModelFactory
        self.productsDataSource = productsDataSource
        self.cartService = cartService
        self.cartHandler = cartHandler
    }
    
    var products = [(product: ProductViewModel, button: IButtonsViewInteractionModel)]()
   
    // Dependencies
    weak var view: IProductsCollectionView?
    
    func makeView() -> IProductView {
        productViewFactory.makeProductView(cartService: cartService)
    }
}

// MARK: - IProductsCollectionPresenter

extension ProductsCollectionPresenter: IProductsCollectionPresenter {
    
    func updateData(userInfo: UserInfo, bonuses: [Bonus], goods: [Product]) {
        self.products = productsDataSource.getData(goods: goods, userInfo: userInfo, bonuses: bonuses).map({ product in
            return (product, self.productButtonModelFactory(product.id, cartService))
        })
    }

    func updateStateButton() {
        view?.updateCartButton(isHidden: cartService.loadCartProduct().isEmpty)
    }

    func didTapPrimaryButton() {
        let viewController = cartHandler()
        view?.push(viewController: viewController)
    }
}

// MARK: - ICartProductDelegate

extension ProductsCollectionPresenter: ICartProductDelegate {
    func cartProductDidChanged() {
        updateStateButton()
    }
}
