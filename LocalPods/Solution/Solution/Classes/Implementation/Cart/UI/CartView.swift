//
//  CartView.swift
//  Solution
//
//  Created by Arina Kolganova on 16.01.2025.
//

import AppBase

final class CartView: UIView {
    // UI
    private let products: [CartProductViewModel]
    private let cartButtonsInteractionModel: ICartButtonsViewInteractionModel?

    // MARK: Initialization

    init(products: [CartProductViewModel], cartButtonsInteractionModel: ICartButtonsViewInteractionModel?) {
        self.products = products
        self.cartButtonsInteractionModel = cartButtonsInteractionModel

        super.init(frame: .zero)

        backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: ICart

extension CartView: ICartView {
    func configure(totalCartViewModel: TotalCartViewModel, bonusViewModel: BonusViewModel) {
    }
}
