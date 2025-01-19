//
//  GoodsBannerService.swift
//  AppBase
//
//  Created by m.titor on 25.12.2024.
//

import Foundation
import AppBase
import protocol AppBase.IGoodsBannerService
import protocol ProdMobileCore.INetworkingService

final class GoodsBannerService: IGoodsBannerService {

    // Dependencies
    private let networkService: INetworkingService

    // MARK: - Initialization

    init(networkService: INetworkingService) {
        self.networkService = networkService
    }

    // MARK: - IGoodsBannerService

    func loadGoodsBanner(completion: @escaping (Result<GoodsBanner, Error>) -> Void) {
        fatalError("Необходимо реализовать метод")
    }
}
