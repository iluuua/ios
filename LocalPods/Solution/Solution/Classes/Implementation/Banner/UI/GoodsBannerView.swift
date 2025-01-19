//
//  GoodsBannerView.swift
//  AppBase
//
//  Created by m.titor on 25.12.2024.
//

import UIKit
import protocol AppBase.IGoodsBannerView
import struct AppBase.GoodsBanner
import struct AppBase.GoodsBannerViewModel
import protocol ProdMobileCore.IImageFactory

final class GoodsBannerView: UICollectionReusableView, IGoodsBannerView {

    // UI

    // MARK: - Initialization

    init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - IGoodsBannerView

    func configure(with model: GoodsBannerViewModel) {
    }
}
