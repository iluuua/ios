//
//  GoodsBanner.swift
//  AppBase
//
//  Created by m.titor on 25.12.2024.
//

import Foundation

public struct GoodsBanner {
    
    public let largeBanner: LargeBanner
    public let smallBanner: SmallBanner?
    
    public init(largeBanner: LargeBanner, smallBanner: SmallBanner?) {
        self.largeBanner = largeBanner
        self.smallBanner = smallBanner
    }
}

public struct LargeBanner {
    
    public let priority: Int
    public let imageId: String
    public let title: String
    public let description: String
    public let bonus: LargeBannerBonus?
    
    public init(
        priority: Int,
        imageId: String,
        title: String,
        description: String,
        bonus: LargeBannerBonus?
    ) {
        self.priority = priority
        self.imageId = imageId
        self.title = title
        self.description = description
        self.bonus = bonus
    }
}

public struct LargeBannerBonus: Decodable {
    
    public let value: Int
    public let postfix: String
    
    public init(value: Int, postfix: String) {
        self.value = value
        self.postfix = postfix
    }
}

public struct SmallBanner {
    
    public let priority: Int
    public let rightLabel: String
    public let leftLabel: String
    
    public init(priority: Int,
                rightLabel: String,
                leftLabel: String) {
        self.priority = priority
        self.rightLabel = rightLabel
        self.leftLabel = leftLabel
    }
}
