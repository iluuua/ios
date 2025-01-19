//
//  ProductView.swift
//  AppBase
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import AppBase
import ProdMobileCore

final class ProductView: UIView {

    // Dependencies
    private let cartService: ICartService

    // MARK: - Init

    init(cartService: ICartService) {
        self.cartService = cartService

        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductView: IProductView {
    
    func configure(
        product: ProductViewModel,
        buttonsInteractionModel: IButtonsViewInteractionModel
    ) {
        fatalError("Необходимо реализовать метод")
    }
    
    func prepareForReuse() {
        fatalError("Необходимо реализовать метод")
    }
}

// MARK: - ICartProductDelegate

extension ProductView: ICartProductDelegate {
    func cartProductDidChanged() {
        fatalError("Необходимо реализовать метод")
    }
}
