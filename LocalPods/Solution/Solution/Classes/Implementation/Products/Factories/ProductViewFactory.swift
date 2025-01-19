//
//  ProductViewFactory.swift
//  Pods
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import Foundation
import AppBase

final class ProductViewFactory: IProductViewFactory {
    func makeProductView(cartService: ICartService) -> IProductView {
        ProductView(cartService: cartService)
    }
}

