//
//  ICartPresenter.swift
//  AppBase
//
//  Created by Arina Kolganova on 15.01.2025.
//

import Foundation

public protocol ICartPresenter {
    var view: ICartViewController? { get set }
    var products: [CartProductViewModel] { get }

    func makeView() -> ICartView
    func cardButtonDidTap()
}
