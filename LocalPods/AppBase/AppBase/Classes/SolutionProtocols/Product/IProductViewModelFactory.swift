//
//  IProductViewModelFactory.swift
//  Solution
//
//  Created by a yatsenko on 26.12.2024.
//

import Foundation

public protocol IProductViewModelFactory: AnyObject {
    func makeProductViewModel(userInfo: UserInfo, bonuses: [Bonus], product: Product) -> ProductViewModel
    func makeCartViewModel(product: Product, count: Int) -> CartProductViewModel
    func makeTotalCartViewModel(price: Double, weight: Double) -> TotalCartViewModel
    func makeBonusViewModel(cashback: Double, bonus: Double) -> BonusViewModel
}
