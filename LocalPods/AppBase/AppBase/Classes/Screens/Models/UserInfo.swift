//
//  UserInfo.swift
//  AppBase
//
//  Created by a yatsenko on 07.01.2025.
//

import Foundation

public struct UserInfo {
    
    public let lastGoodsCat: [String]
    public let availableBonuses: [String]
    public let favourites: [String]
    public let activityLevel: Int

    public init(
        lastGoodsCat: [String],
        availableBonuses: [String],
        favourites: [String],
        activityLevel: Int
    ) {
        self.lastGoodsCat = lastGoodsCat
        self.availableBonuses = availableBonuses
        self.favourites = favourites
        self.activityLevel = activityLevel
    }
}
