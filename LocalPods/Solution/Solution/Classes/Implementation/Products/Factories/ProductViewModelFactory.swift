//
//  ProductViewModelFactory.swift
//  Solution
//
//  Created by a yatsenko on 26.12.2024.
//

import Foundation
import AppBase
import ProdMobileCore

final class ProductViewModelFactory: IProductViewModelFactory {

    private let imageFactory: IImageFactory
    
    init(imageFactory: IImageFactory) {
        self.imageFactory = imageFactory
    }
    
    func makeProductViewModel(userInfo: UserInfo, bonuses: [Bonus], product: Product) -> ProductViewModel {
        fatalError("Необходимо реализовать метод")
    }

    func makeCartViewModel(product: Product, count: Int) -> CartProductViewModel {
        fatalError("Необходимо реализовать метод")
    }

    func makeTotalCartViewModel(price: Double, weight: Double) -> TotalCartViewModel {
        fatalError("Необходимо реализовать метод")
    }

    func makeBonusViewModel(cashback: Double, bonus: Double) -> BonusViewModel {
        fatalError("Необходимо реализовать метод")
    }
}
