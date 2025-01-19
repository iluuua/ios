//
//  TotalView.swift
//  AppBase
//
//  Created by Arina Kolganova on 25.12.2024.
//

import UIKit
import AppBase

public final class TotalView: UIView {
    // UI

    // MARK: Initialization

    public init() {
        super.init(frame: .zero)

        backgroundColor = .systemBackground
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - ITotalView

extension TotalView: ITotalView {
    public func configure(viewModel: TotalCartViewModel) {

    }
}
