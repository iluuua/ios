//
//  IGoodsBannerService.swift
//  AppBase
//
//  Created by m.titor on 25.12.2024.
//

public protocol IGoodsBannerService: AnyObject {

    func loadGoodsBanner(completion: @escaping (Result<GoodsBanner, Error>) -> Void)
}
