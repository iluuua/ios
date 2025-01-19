//
//  UserInfoService.swift
//  Solution
//
//  Created by a yatsenko on 07.01.2025.
//

import Foundation
import ProdMobileCore
import AppBase

final class UserInfoService: IUserInfoService {
    
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
    
    // MARK: - IUserInfoService
    
    func loadUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void) {
        fatalError("Необходимо реализовать метод")
    }
}
