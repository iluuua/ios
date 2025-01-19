//
//  ICartButtonsViewInteractionModel.swift
//  Solution
//
//  Created by Arina Kolganova on 16.01.2025.
//

public protocol ICartButtonsViewInteractionModel {
    func configure(cardHandler: @escaping () -> Void)
    func onPressedCard()
    func onPressedDelete(id: String)
}

