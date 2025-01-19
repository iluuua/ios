//
//  Product.swift
//  AppBase
//
//  Created by Alex Yatsenko on 22.12.2024.
//

import Foundation

public struct Product {
    public let id: Int
    public let name: String
    public let isPremium: Bool
    public var quantity: Int = .zero
}
