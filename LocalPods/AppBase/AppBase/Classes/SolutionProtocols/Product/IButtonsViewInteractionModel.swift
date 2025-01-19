//
//  IButtonsViewInteractionModel.swift
//  Solution
//
//  Created by Kuznetsov Mikhail on 16.01.2025.
//


public protocol IButtonsViewInteractionModel {
    var quantity: Int { get }
    func onPressedAdd()
    func onPressedRemove()
}
