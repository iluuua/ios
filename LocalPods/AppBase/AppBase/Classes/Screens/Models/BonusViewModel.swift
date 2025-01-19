//
//  BonusViewModel.swift
//  AppBase
//
//  Created by Arina Kolganova on 10.01.2025.
//

import Foundation

public struct BonusViewModel {
    public let cashback: String
    public let bonus: String

    public init(cashback: String, bonus: String) {
        self.cashback = cashback
        self.bonus = bonus
    }
}
