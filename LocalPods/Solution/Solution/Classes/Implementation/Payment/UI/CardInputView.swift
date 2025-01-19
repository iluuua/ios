//
//  CardInputView.swift
//  AppBase
//
//  Created by m.titor on 21.12.2024.
//

import UIKit
import protocol AppBase.ICardInputView
import protocol AppBase.CardInputViewDelegate
import class AppBase.CardInputViewModel

final public class CardInputView: UIView, ICardInputView {

    // dependencies
    weak public var delegate: CardInputViewDelegate?

    // Model
    private var model: CardInputViewModel = CardInputViewModel()

    // UI

    // MARK: - Initialization

    public init() {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("Not implemented")
    }

    // MARK: - ICardInputView

    public func configure(viewModel: CardInputViewModel) {
        fatalError("Необходимо реализовать метод")
    }
    
    public func viewModel() -> CardInputViewModel { model }
}

// MARK: - UITextFieldDelegate

extension CardInputView: UITextFieldDelegate {

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return false
    }

    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return false
    }
}
