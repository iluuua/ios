//
//  GoodsBannerViewFactory.swift
//  AppBase
//
//  Created by m.titor on 03.01.2025.
//

import protocol AppBase.IGoodsBannerView
import protocol AppBase.IGoodsBannerViewFactory

final class GoodsBannerViewFactory: IGoodsBannerViewFactory {
    
    func makeGoodsBannerView() -> IGoodsBannerView {
        GoodsBannerView()
    }
}
