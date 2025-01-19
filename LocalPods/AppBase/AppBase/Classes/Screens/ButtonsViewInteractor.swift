//
//  ButtonsViewInteractor.swift
//  Solution
//
//  Created by a yatsenko on 14.01.2025.
//

public protocol IButtonsViewInteractor {
    var quantity: Int { get set }
    func configure(productId: String)
    func increase(productId: String)
    func decrease(productId: String)
}
