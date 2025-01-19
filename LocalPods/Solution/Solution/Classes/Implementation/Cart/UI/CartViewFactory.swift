//
//  CartViewFactory.swift
//  Solution
//
//  Created by Arina Kolganova on 24.12.2024.
//

import Foundation
import AppBase

final class CartViewFactory: ICartViewFactory {
    func makeCartView(products: [CartProductViewModel], cartButtonsInteractionModel: ICartButtonsViewInteractionModel) -> ICartView {
        CartView(products: products, cartButtonsInteractionModel: cartButtonsInteractionModel)
    }
}
