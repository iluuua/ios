//
//  CartProductViewModel.swift
//  AppBase
//
//  Created by Arina Kolganova on 08.01.2025.
//

public struct CartProductViewModel {
    public let id: String
    public let name: String
    public let totalWeight: String
    public let totalPrice: String
    public let priceDescription: String
    public let image: UIImage

    public init(
        id: String,
        name: String,
        totalWeight: String,
        totalPrice: String,
        priceDescription: String,
        image: UIImage
    ) {
        self.id = id
        self.name = name
        self.totalWeight = totalWeight
        self.totalPrice = totalPrice
        self.priceDescription = priceDescription
        self.image = image
    }
}
