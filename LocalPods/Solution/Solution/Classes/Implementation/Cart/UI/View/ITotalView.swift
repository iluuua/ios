//
//  ITotalView.swift
//  AppBase
//
//  Created by Arina Kolganova on 25.12.2024.
//

import AppBase

public protocol ITotalView: UIView {
    func configure(viewModel: TotalCartViewModel)
}
