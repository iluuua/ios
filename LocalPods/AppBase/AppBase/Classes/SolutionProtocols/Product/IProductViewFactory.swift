//
//  IProductViewFactory.swift
//  Pods
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import Foundation

public protocol IProductViewFactory {
    func makeProductView(cartService: ICartService) -> IProductView
}
