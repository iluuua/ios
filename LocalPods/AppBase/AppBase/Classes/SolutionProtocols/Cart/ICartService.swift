//
//  ICartService.swift
//  AppBase
//
//  Created by Arina Kolganova on 08.01.2025.
//

public protocol ICartService: AnyObject {
    var productSequence: [String] { get }

    func updateProduct(id: String, count: Int)
    func removeProduct(id: String)
    func loadCartProduct() -> [CartProduct]
    func productCount(id: String) -> Int
    func subscribe(_ delegate: ICartProductDelegate)
}

public protocol ICartProductDelegate: AnyObject {
    func cartProductDidChanged()
}

public struct CartProduct {
    public let product: Product
    public let count: Int

    public init(product: Product, count: Int) {
        self.product = product
        self.count = count
    }
}
