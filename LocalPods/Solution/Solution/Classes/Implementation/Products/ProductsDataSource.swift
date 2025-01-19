//
//  ProductsDataSource.swift
//  Solution
//
//  Created by a yatsenko on 15.01.2025.
//

import AppBase

final class ProductsDataSource: IProductsDataSource {
    
    private let productViewModelFactory: IProductViewModelFactory

    init(productViewModelFactory: IProductViewModelFactory) {
        self.productViewModelFactory = productViewModelFactory
    }
    
    func getData(goods: [Product], userInfo: UserInfo, bonuses: [Bonus]) -> [ProductViewModel] {
        fatalError("Необходимо реализовать метод")
    }
}
