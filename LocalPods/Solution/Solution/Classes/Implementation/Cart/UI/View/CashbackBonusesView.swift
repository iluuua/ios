//
//  CashbackBonusesView.swift
//  Solution
//
//  Created by Arina Kolganova on 25.12.2024.
//

import UIKit
import AppBase

public final class CashbackBonusesView: UIView {
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

// MARK: - ICashbackBonusesView

extension CashbackBonusesView: ICashbackBonusesView {
    public func configure(viewModel: BonusViewModel) {

    }
}
