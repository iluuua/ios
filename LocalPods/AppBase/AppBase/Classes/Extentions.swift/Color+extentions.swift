//
//  Color+extentions.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 18.02.2024.
//

import UIKit

extension UIColor {

    public convenience init?(hexString: String) {
        if let hexValue = UInt64(hexString: hexString) {
            self.init(hex: hexValue)
        } else {
            return nil
        }
    }
    public convenience init(hex: UInt64) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
}

extension UInt64 {

    public init?(hexString: String) {
        let trimmed = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: trimmed)

        if trimmed.hasPrefix("#") {
            scanner.currentIndex = trimmed.index(after: trimmed.startIndex)
        }

        var result: UInt64 = 0
        if scanner.scanHexInt64(&result) {
            self = result
        } else {
            return nil
        }
    }
}

