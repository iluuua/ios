//
//  ProductCartModel.swift
//  AppBase
//
//  Created by Arina Kolganova on 08.01.2025.
//

import Foundation

public struct ProductCartModel {
    public var identifier: String
    public var quantity: Int = .zero
    
    public init(identifier: String, quantity: Int = .zero) {
        self.identifier = identifier
        self.quantity = quantity
    }
}
