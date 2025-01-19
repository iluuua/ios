//
//  ProductViewModel.swift
//  Solution
//
//  Created by a yatsenko on 26.12.2024.
//

import UIKit

public struct ProductViewModel {
    
    public struct Badge {        
        public let label: String
        public let tintColor: String?
        public let baseColor: String?
        
        public init(
            label: String,
            tintColor: String? = nil,
            baseColor: String? = nil
        ) {
            self.label = label
            self.tintColor = tintColor
            self.baseColor = baseColor
        }
    }
    
    public let id: String
    public let name: String
    public let producer: String
    public let weight: String
    public let price: String
    public let image: UIImage
    public let cost: Double
    public let score: Int
    public let bottomBadge: Badge?
    public let topBadge: Badge?
    public let buttonsText: (_ quantity: Int) -> String
    
    public init(
        id: String,
        name: String,
        producer: String,
        weight: String,
        price: String,
        image: UIImage,
        cost: Double,
        score: Int,
        bottomBadge: Badge?,
        topBadge: Badge?,
        buttonsText: @escaping (_ quantity: Int) -> String
    ) {
        self.id = id
        self.name = name
        self.producer = producer
        self.weight = weight
        self.price = price
        self.image = image
        self.cost = cost
        self.score = score
        self.bottomBadge = bottomBadge
        self.topBadge = topBadge
        self.buttonsText = buttonsText
    }
}
