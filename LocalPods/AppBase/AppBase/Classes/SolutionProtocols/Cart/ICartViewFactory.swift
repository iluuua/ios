//
//  ICartViewFactory.swift
//  Solution
//
//  Created by Arina Kolganova on 25.12.2024.
//

public protocol ICartViewFactory {
    func makeCartView(products: [CartProductViewModel], cartButtonsInteractionModel: ICartButtonsViewInteractionModel) -> ICartView
}
