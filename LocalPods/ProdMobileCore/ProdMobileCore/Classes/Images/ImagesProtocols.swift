//
//  Protocols.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 12.02.2024.
//

import UIKit

/// Фабрика изображений
public protocol IImageFactory {
    /// Возвращает изображение для большого товарного баннера по названию (идентификатору) картинки
    func largeBannerImage(id: String) -> UIImage
    /// Возвращает изображение для маленького товарного баннера
    func smallBannerImage() -> UIImage
    /// Возвращает изображение товара по названию (идентификатору) картинки
    func goodsItemImage(id: String) -> UIImage
}
