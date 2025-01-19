//
//  IProductsDataSource.swift
//  AppBase
//
//  Created by a yatsenko on 15.01.2025.
//

import Foundation

public protocol IProductsDataSource {
    func getData(goods: [Product], userInfo: UserInfo, bonuses: [Bonus]) -> [ProductViewModel]
}
