//
//  BonusesService.swift
//  AppBase
//
//  Created by Arina Kolganova on 09.01.2025.
//

import Foundation
import ProdMobileCore
import AppBase

final class BonusesService: IBonusesService {
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

    // MARK: - IBonusesService

    func loadBonuses(completion: @escaping (Result<[Bonus], Error>) -> Void) {
        fatalError("Необходимо реализовать метод")
    }
}
