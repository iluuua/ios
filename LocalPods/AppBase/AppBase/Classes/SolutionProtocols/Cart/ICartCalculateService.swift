//
//  ICalculateCartService.swift
//  AppBase
//
//  Created by Arina Kolganova on 10.01.2025.
//

public protocol ICalculateCartService: AnyObject {
    func calculateCash(for products: [CartProduct]) -> Double
    func calculateWeight(for products: [CartProduct]) -> Double
    func calculateBonus(for products: [CartProduct], bonuses: [Bonus], userInfo: UserInfo) -> (Double, Double)
}
