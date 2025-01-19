//
//  CartProductView.swift
//  AppBase
//
//  Created by Arina Kolganova on 25.12.2024.
//

import AppBase
import UIKit

final class CartProductView: UIView {
    // UI

    // MARK: Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - IProductView

extension CartProductView: ICartProductView {
    func configure(product: CartProductViewModel, actionHandler: @escaping (String) -> Void) {
        
    }
}
