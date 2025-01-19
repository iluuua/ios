//
//  Product.swift
//  AppBase
//
//  Created by a yatsenko on 23.12.2024.
//

import Foundation

public struct Product {

    public struct Producer {
        public let id: String
        public let name: String
        
        public init(id: String, name: String) {
            self.id = id
            self.name = name
        }
    }
    
    public struct ItemCountity {

        public enum ItemType: String {
            case gramm, kilo
        }
        
        public let type: ItemType
        public let value: Double

        public init(type: ItemType, value: Double) {
            self.type = type
            self.value = value
        }
    }
    
    public let id: String
    public let name: String
    public let imageId: String
    public let producer: Producer
    public let itemCountity: ItemCountity
    public let cost: Double
    public let popularity: Int
    public let category: String
    public let rating: Double?
    public let isNew: Bool?
    public let bonusIds: [String]?
    
    public init(
        id: String,
        name: String,
        imageId: String,
        producer: Producer,
        itemCountity: ItemCountity,
        cost: Double,
        popularity: Int,
        category: String,
        rating: Double?,
        isNew: Bool?,
        bonusIds: [String]?
    ) {
        self.id = id
        self.name = name
        self.imageId = imageId
        self.producer = producer
        self.itemCountity = itemCountity
        self.cost = cost
        self.popularity = popularity
        self.category = category
        self.rating = rating
        self.isNew = isNew
        self.bonusIds = bonusIds
    }
}
