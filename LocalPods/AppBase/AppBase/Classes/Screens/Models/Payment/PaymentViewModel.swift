//
//  PaymentViewModel.swift
//  AppBase
//
//  Created by m.titor on 21.12.2024.
//

public final class PaymentViewModel {
    
    /// Состояние кнопки оплаты на экране оплаты
    public enum PaymentButtonState {
        /// Кнопка спрятана
        case hidden
        /// Кнопка отображается, но неактивна.
        case disabled
        /// Кнопка отображается и активна
        case enabled
    }

    // Properties
    var cardInputViewModel: CardInputViewModel
    var buttonState: PaymentButtonState

    // MARK: - Initialization

    init(cardInputViewModel: CardInputViewModel,
         buttonState: PaymentButtonState) {
        self.cardInputViewModel = cardInputViewModel
        self.buttonState = buttonState
    }
}
