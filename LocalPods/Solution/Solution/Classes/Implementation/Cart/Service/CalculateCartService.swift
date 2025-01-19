//
//  CalculateCartService.swift
//  AppBase
//
//  Created by Arina Kolganova on 10.01.2025.
//

import Foundation
import ProdMobileCore
import AppBase

final class CalculateCartService: ICalculateCartService {
    func calculateCash(for products: [CartProduct]) -> Double {
        fatalError("Необходимо реализовать метод")
    }

    func calculateWeight(for products: [CartProduct]) -> Double {
        fatalError("Необходимо реализовать метод")
    }

    func calculateBonus(for products: [CartProduct], bonuses: [Bonus], userInfo: UserInfo) -> (Double, Double) {
        fatalError("Необходимо реализовать метод")
    }
}
