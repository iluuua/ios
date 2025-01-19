//
//  ProductsCollectionAssembly.swift
//  Solution
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import Foundation

final class ProductsCollectionAssembly {
    
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
    
    func assemble() -> IProductsCollectionView {
        let presenter = ProductsCollectionPresenter(
            productViewFactory: productViewFactory,
            productButtonModelFactory: productButtonModelFactory,
            productsDataSource: productsDataSource,
            cartService: cartService,
            cartHandler: cartHandler
        )
        let controller = ProductsCollectionViewController(presenter: presenter)
        
        cartService.subscribe(presenter)
        presenter.view = controller
        return controller
    }
}
