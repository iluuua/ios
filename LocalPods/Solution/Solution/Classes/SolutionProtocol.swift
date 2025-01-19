//
//  SolutionProtocol.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 21.02.2024.
//

import Foundation
import ProdMobileCore
import AppBase

public protocol SolutionAssemblyProtocol {
    
    // MARK: - Товарный баннер
    
    /// **Задание 1**
    static func goodsBannerService(networkService: INetworkingService) -> IGoodsBannerService

    /// **Задание 2**
    static func goodsBannerViewModelFactory(imageFactory: IImageFactory) -> IGoodsBannerViewModelFactory

    /// **Задание 3**
    static func goodsBannerViewFactory() -> IGoodsBannerViewFactory

    // MARK: - Товарная лента

    /// **Задание 4**
    static func goodsService(networkService: INetworkingService, storage: IPersistenceStorage) -> IGoodsService
    /// **Задание 4**
    static func userInfoService(networkService: INetworkingService, storage: IPersistenceStorage) -> IUserInfoService
    /// **Задание 4**
    static func bonusesService(networkService: INetworkingService, storage: IPersistenceStorage) -> IBonusesService

    /// **Задание 5**
    static func productViewModelFactory(imageFactory: IImageFactory) -> IProductViewModelFactory
    /// **Задание 5**
    static func productsDataSource(productViewModelFactory: IProductViewModelFactory) -> IProductsDataSource
    /// **Задание 5**
    static func buttonsViewInteractionModel(productId: String, cartService: ICartService) -> IButtonsViewInteractionModel

    /// **Задание 6**
    static func productViewFactory() -> IProductViewFactory

    // MARK: - Корзина

    /// **Задание 7**
    static func calculateCartService() -> ICalculateCartService
    /// **Задание 7**
    static func cartPresenter(
        cartViewFactory: ICartViewFactory,
        productViewModelFactory: IProductViewModelFactory,
        cartService: ICartService,
        bonusesService: IBonusesService,
        calculateCartService: ICalculateCartService,
        userInfoService: IUserInfoService,
        paymentCartService: IPaymentCartService,
        cartButtonsInteractionModel: ICartButtonsViewInteractionModel,
        cardHandler: @escaping () -> UIViewController
    ) -> ICartPresenter

    /// **Задание 8**
    static func cartService(storage: IPersistenceStorage) -> ICartService
    
    /// **Задание 9**
    static func cartViewFactory() -> ICartViewFactory
    /// **Задание 9**
    static func cartButtonsViewInteractionModel(cartService: ICartService) -> ICartButtonsViewInteractionModel

    // MARK: - Оплата

    /// **Задание 10**
    static func cardInputProcessor() -> ICardInputProcessor

    /// **Задание 11**
    static func cardInputView() -> ICardInputView
}
