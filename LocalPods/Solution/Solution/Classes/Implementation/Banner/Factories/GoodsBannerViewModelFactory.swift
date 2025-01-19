//
//  GoodsBannerViewModelFactory.swift
//  AppBase
//
//  Created by m.titor on 03.01.2025.
//

import struct AppBase.GoodsBanner
import struct AppBase.LargeBanner
import struct AppBase.SmallBanner
import struct AppBase.GoodsBannerViewModel
import protocol AppBase.IGoodsBannerViewModelFactory
import protocol ProdMobileCore.IImageFactory

final class GoodsBannerViewModelFactory: IGoodsBannerViewModelFactory {
    
    // Dependencies
    private let imageFactory: IImageFactory
    
    // MARK: - Initialization
    
    init(imageFactory: IImageFactory) {
        self.imageFactory = imageFactory
    }
    
    // MARK: - IGoodsBannerViewModelFactory
    
    func makeViewModel(banner: GoodsBanner) -> GoodsBannerViewModel {
        
        fatalError("Необходимо реализовать метод")
    }
}
