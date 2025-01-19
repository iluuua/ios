//
//  IProductView.swift
//  Solution
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import Foundation

public protocol IProductView: UIView, ICartProductDelegate {
    func configure(product: ProductViewModel, buttonsInteractionModel: IButtonsViewInteractionModel)
    func prepareForReuse()
}
