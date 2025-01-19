//
//  ImageFactory.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 12.02.2024.
//

import UIKit

public final class ImageFactory: IImageFactory {

    // MARK: - Init

    public init() {}

    // MARK: - Public

    public func smallBannerImage() -> UIImage {
        image("bonus-badge")
    }

    public func largeBannerImage(id: String) -> UIImage {
        image("banner-1-img")
    }
    
    public func goodsItemImage(id: String) -> UIImage {
        image(id, or: image("goods-placeholder"))
//        switch id {
//        case "goods-1-img": return image("goods-1-img")
//        case "goods-2-img": return image("goods-2-img")
//        case "goods-3-img": return image("goods-3-img")
//        case "goods-4-img": return image("goods-4-img")
//        default: return image("goods-placeholder")
//        }
    }

    // MARK: - Private

    private func image(_ named: String) -> UIImage {
        UIImage(named: named, in: bundle(), with: nil) ?? UIImage()
    }
    
    private func image(_ named: String, or fallback: UIImage) -> UIImage {
        UIImage(named: named, in: bundle(), with: nil) ?? fallback
    }
    
    private func bundle() -> Bundle {
        let resourcesBundle = "ProdMobileCoreResources.bundle"
        let frameworkBundle = Bundle(for: Self.self)
        if let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent(resourcesBundle),
           let resourceBundle = Bundle(url: bundleURL) {
            return resourceBundle
        } else {
            return frameworkBundle
        }
    }
}
