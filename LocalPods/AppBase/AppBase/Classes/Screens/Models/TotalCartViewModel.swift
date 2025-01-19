//
//  TotalCartViewModel.swift
//  AppBase
//
//  Created by Arina Kolganova on 10.01.2025.
//

import Foundation

public struct TotalCartViewModel {
    public let price: String
    public let weight: String

    public init(price: String, weight: String) {
        self.price = price
        self.weight = weight
    }
}
