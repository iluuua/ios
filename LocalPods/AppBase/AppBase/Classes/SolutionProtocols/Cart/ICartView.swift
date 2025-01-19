//
//  ICartView.swift
//  AppBase
//
//  Created by Arina Kolganova on 15.01.2025.
//

public protocol ICartView: UIView {
    func configure(totalCartViewModel: TotalCartViewModel, bonusViewModel: BonusViewModel)
}
