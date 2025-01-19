//
//  RootAssembly.swift
//  PROD-Mobile
//
//  Created by Kuznetsov Mikhail on 20.02.2024.
//

import UIKit
import ProdMobileCore
import AppBase
import Solution

final class RootAssembly {
    func assembleRoot() -> UIViewController {
        
        // Main
        let imageFactory = ImageFactory()
        let networkService = NetworkingService()
        let persistenceStorage = PersistenceStorage()

        // Home
        let productViewFactory = SolutionAssembly.productViewFactory()
        let productViewModelFactory = SolutionAssembly.productViewModelFactory(imageFactory: imageFactory)
        let goodsService = SolutionAssembly.goodsService(networkService: networkService, storage: persistenceStorage)
        let userInfoService = SolutionAssembly.userInfoService(networkService: networkService, storage: persistenceStorage)

        // Banner
        let goodsBannerViewFactory = SolutionAssembly.goodsBannerViewFactory()
        let goodsBannerViewModelFactory = SolutionAssembly.goodsBannerViewModelFactory(imageFactory: imageFactory)
        let goodsBannerService = SolutionAssembly.goodsBannerService(networkService: networkService)

        // Cart
        let cartService = SolutionAssembly.cartService(storage: persistenceStorage)
        let calculateCartService = SolutionAssembly.calculateCartService()
        let bonusesService = SolutionAssembly.bonusesService(networkService: networkService, storage: persistenceStorage)

        let cardHandler  = {
            let cardViewFactory = { SolutionAssembly.cardInputView() }
            return AppBaseAssembly.paymentController(paymentPresenter: PaymentPresenter(processor: SolutionAssembly.cardInputProcessor(), paymentService: PaymentService()), cardInputView: cardViewFactory)
        }

        let cartHandler = {
            let cartViewFactory = SolutionAssembly.cartViewFactory()
            let presenter = SolutionAssembly.cartPresenter(
                cartViewFactory: cartViewFactory,
                productViewModelFactory: productViewModelFactory,
                cartService: cartService,
                bonusesService: bonusesService,
                calculateCartService: calculateCartService,
                userInfoService: userInfoService,
                paymentCartService: PaymentCartService(), 
                cartButtonsInteractionModel: SolutionAssembly.cartButtonsViewInteractionModel(cartService: cartService),
                cardHandler: cardHandler
            )
            return AppBaseAssembly.cartController(presenter: presenter)
        }
        
        let productsDataSource = SolutionAssembly.productsDataSource(productViewModelFactory: productViewModelFactory)
        
        let productButtonModelFactory = { (productId: String, cartService: ICartService) in
            SolutionAssembly.buttonsViewInteractionModel(productId: productId, cartService: cartService)
        }

        return AppBaseAssembly.homeController(
            goodsService: goodsService,
            goodsBannerService: goodsBannerService,
            userInfoService: userInfoService,
            bonusesService: bonusesService,
            productViewFactory: productViewFactory,
            productButtonModelFactory: productButtonModelFactory,
            goodsBannerViewFactory: goodsBannerViewFactory,
            productsDataSource: productsDataSource,
            goodsBannerViewModelFactory: goodsBannerViewModelFactory,
            cartService: cartService,
            cartHandler: cartHandler
        )
    }
}
