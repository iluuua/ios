//
//  CartPresenter.swift
//  Solution
//
//  Created by Arina Kolganova on 25.12.2024.
//

import AppBase

public final class CartPresenter {
    // Dependencies
    public weak var view: ICartViewController?
    public var products: [CartProductViewModel] = []

    private var cash: Double = 0.0
    private let cartViewFactory: ICartViewFactory
    private let productViewModelFactory: IProductViewModelFactory
    private let cartService: ICartService
    private let bonusesService: IBonusesService
    private let calculateCartService: ICalculateCartService
    private let userInfoService: IUserInfoService
    private let paymentCartService: IPaymentCartService
    private let cartButtonsInteractionModel: ICartButtonsViewInteractionModel
    private let cardHandler: () -> UIViewController

    // MARK: Initialization

    init(
        cartViewFactory: ICartViewFactory,
        productViewModelFactory: IProductViewModelFactory,
        cartService: ICartService,
        bonusesService: IBonusesService,
        calculateCartService: ICalculateCartService,
        userInfoService: IUserInfoService,
        paymentCartService: IPaymentCartService,
        cartButtonsInteractionModel: ICartButtonsViewInteractionModel,
        cardHandler: @escaping () -> UIViewController
    ) {
        self.cartViewFactory = cartViewFactory
        self.productViewModelFactory = productViewModelFactory
        self.cartService = cartService
        self.bonusesService = bonusesService
        self.calculateCartService = calculateCartService
        self.userInfoService = userInfoService
        self.paymentCartService = paymentCartService
        self.cartButtonsInteractionModel = cartButtonsInteractionModel
        self.cardHandler = cardHandler

        updateStateViewController()
    }

    private func updateStateViewController() {
        fatalError("Необходимо реализовать метод")
    }
}

// MARK: - ICartPresenter

extension CartPresenter: ICartPresenter {
    public func makeView() -> ICartView {
        fatalError("Необходимо реализовать метод")
    }

    public func cardButtonDidTap() {
        fatalError("Необходимо реализовать метод")
    }
}

