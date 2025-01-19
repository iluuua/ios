//
//  IGoodsBannerViewModelFactory.swift
//  AppBase
//
//  Created by m.titor on 03.01.2025.
//

public protocol IGoodsBannerViewModelFactory: AnyObject {
    
    func makeViewModel(banner: GoodsBanner) -> GoodsBannerViewModel
}
