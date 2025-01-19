//
//  Bonus.swift
//  AppBase
//
//  Created by Arina Kolganova on 09.01.2025.
//

import Foundation

public struct Bonus {
    public enum BonusType: String {
        case cashback, points
    }

    public struct Promotion {
        public let baseColor: String
        public let tintColor: String
        public let label: String
        
        public init(baseColor: String, tintColor: String, label: String) {
            self.baseColor = baseColor
            self.tintColor = tintColor
            self.label = label
        }
    }

    public let id: String
    public let type: BonusType
    public let value: Double
    public let promotionExtra: Promotion?
    let availableDueTo: String?
    
    public var availableDate: Date? {
        guard let availableDueTo else { return nil }
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions.insert(.withFractionalSeconds)
        return isoDateFormatter.date(from: availableDueTo)
    }

    public init(
        id: String,
        type: BonusType,
        value: Double,
        promotionExtra: Promotion?,
        availableDueTo: String?
    ) {
        self.id = id
        self.type = type
        self.value = value
        self.promotionExtra = promotionExtra
        self.availableDueTo = availableDueTo
    }
}
