//
//  SolutionAssembly.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 20.02.2024.
//

import Foundation
import ProdMobileCore
import AppBase

public final class SolutionAssembly: SolutionAssemblyProtocol {

    // MARK: - Товарный Баннер

    /// **Задание 1**
    public static func goodsBannerService(networkService: INetworkingService) -> IGoodsBannerService {
        GoodsBannerService(networkService: networkService)
    }

    /// **Задание 2**
    public static func goodsBannerViewModelFactory(imageFactory: IImageFactory) -> IGoodsBannerViewModelFactory {
        GoodsBannerViewModelFactory(imageFactory: imageFactory)
    }

    /// **Задание 3**
    public static func goodsBannerViewFactory() -> IGoodsBannerViewFactory {
        GoodsBannerViewFactory()
    }

    // MARK: - Товарная лента

    /// **Задание 4**
    public static func goodsService(networkService: INetworkingService, storage: IPersistenceStorage) -> IGoodsService {
        GoodsService(networkService: networkService, storage: storage)
    }

    public static func userInfoService(networkService: INetworkingService, storage: IPersistenceStorage) -> IUserInfoService {
        UserInfoService(networkService: networkService, storage: storage)
    }

    public static func bonusesService(networkService: INetworkingService, storage: IPersistenceStorage) -> IBonusesService {
        BonusesService(networkService: networkService, storage: storage)
    }

    /// **Задание 5**
    public static func productViewModelFactory(imageFactory: IImageFactory) -> IProductViewModelFactory {
        ProductViewModelFactory(imageFactory: imageFactory)
    }

    public static func productsDataSource(productViewModelFactory: IProductViewModelFactory) -> IProductsDataSource {
        ProductsDataSource(productViewModelFactory: productViewModelFactory)
    }

    public static func buttonsViewInteractionModel(productId: String, cartService: ICartService) -> IButtonsViewInteractionModel {
        ButtonsViewInteractionModel(productId: productId, cartService: cartService)
    }

    /// **Задание 6**
    public static func productViewFactory() -> IProductViewFactory {
        ProductViewFactory()
    }

    // MARK: - Корзина

    /// **Задание 7**
    public static func calculateCartService() -> ICalculateCartService {
        CalculateCartService()
    }

    public static func cartPresenter(
        cartViewFactory: ICartViewFactory,
        productViewModelFactory: IProductViewModelFactory,
        cartService: ICartService,
        bonusesService: IBonusesService,
        calculateCartService: ICalculateCartService,
        userInfoService: IUserInfoService,
        paymentCartService: IPaymentCartService,
        cartButtonsInteractionModel: ICartButtonsViewInteractionModel,
        cardHandler: @escaping () -> UIViewController
    ) -> ICartPresenter {
        CartPresenter(
            cartViewFactory: cartViewFactory,
            productViewModelFactory: productViewModelFactory,
            cartService: cartService,
            bonusesService: bonusesService,
            calculateCartService: calculateCartService,
            userInfoService: userInfoService,
            paymentCartService: paymentCartService, 
            cartButtonsInteractionModel: cartButtonsInteractionModel,
            cardHandler: cardHandler
        )
    }

    /// **Задание 8**
    public static func cartService(storage: IPersistenceStorage) -> ICartService {
        CartService(storage: storage)
    }

    /// **Задание 9**
    public static func cartViewFactory() -> ICartViewFactory {
        CartViewFactory()
    }

    public static func cartButtonsViewInteractionModel(cartService: ICartService) -> ICartButtonsViewInteractionModel {
        CartButtonsViewInteractionModel(cartService: cartService)
    }

    // MARK: - Оплата

    /// **Задание 10**
    public static func cardInputProcessor() -> ICardInputProcessor {
        CardInputProcessor()
    }

    /// **Задание 11**
    public static func cardInputView() -> ICardInputView {
        CardInputView()
    }
}
