//
//  CartService.swift
//  AppBase
//
//  Created by Arina Kolganova on 08.01.2025.
//

import Foundation
import ProdMobileCore
import AppBase

final class CartService: ICartService {
    private(set) var productSequence: [String] = []

    private let storage: IPersistenceStorage

    init(storage: IPersistenceStorage) {
        self.storage = storage
    }

    // MARK: - ICartService

    func updateProduct(id: String, count: Int) {
        fatalError("Необходимо реализовать метод")
    }

    func removeProduct(id: String) {
        fatalError("Необходимо реализовать метод")
    }

    func loadCartProduct() -> [CartProduct] {
        fatalError("Необходимо реализовать метод")
    }

    func productCount(id: String) -> Int {
        fatalError("Необходимо реализовать метод")
    }

    func subscribe(_ delegate: ICartProductDelegate) {
        fatalError("Необходимо реализовать метод")
    }
}

struct WeakCartProductDelegate {
    weak var value: ICartProductDelegate?

    init(_ value: ICartProductDelegate?) {
        self.value = value
    }
}
