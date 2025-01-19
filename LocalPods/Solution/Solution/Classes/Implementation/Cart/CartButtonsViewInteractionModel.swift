//
//  CartButtonsViewInteractionModel.swift
//  Solution
//
//  Created by Arina Kolganova on 16.01.2025.
//

import AppBase

final class CartButtonsViewInteractionModel: ICartButtonsViewInteractionModel {

    private let cartService: ICartService

    init(cartService: ICartService) {
        self.cartService = cartService
    }

    func configure(cardHandler: @escaping () -> ()) {
        fatalError("Необходимо реализовать метод")
    }

    func onPressedCard() {
        fatalError("Необходимо реализовать метод")
    }

    func onPressedDelete(id: String) {
        fatalError("Необходимо реализовать метод")
    }
}

