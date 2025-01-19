//
//  GoodsService.swift
//  Solution
//
//  Created by a yatsenko on 23.12.2024.
//

import Foundation
import ProdMobileCore
import AppBase


final class GoodsService: IGoodsService {
    
    // Dependencies
    private let networkService: INetworkingService
    private let storage: IPersistenceStorage
    
    init(
        networkService: INetworkingService,
        storage: IPersistenceStorage
    ) {
        self.networkService = networkService
        self.storage = storage
    }
    
    // MARK: - IGoodsService
    
    func loadGoods(completion: @escaping (Result<[Product], Error>) -> Void) {
        fatalError("Необходимо реализовать метод")
    }
}
