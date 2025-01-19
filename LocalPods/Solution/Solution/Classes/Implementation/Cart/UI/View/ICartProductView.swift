//
//  ICartProductView.swift
//  AppBase
//
//  Created by Arina Kolganova on 08.01.2025.
//

import UIKit
import AppBase

public protocol ICartProductView: UIView {
    func configure(product: CartProductViewModel, actionHandler: @escaping (String) -> Void)
}
