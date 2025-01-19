//
//  ICardInputView.swift
//  AppBase
//
//  Created by Kuznetsov Mikhail on 21.12.2024.
//

public protocol ICardInputView: UIView {

    var delegate: CardInputViewDelegate? { get set }

    func configure(viewModel: CardInputViewModel)
    func viewModel() -> CardInputViewModel
}
