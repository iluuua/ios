//
//  CardInputProcessor.swift
//  Solution
//
//  Created by m.titor on 07.01.2025.
//

import protocol AppBase.ICardInputProcessor
import class AppBase.CardInputViewModel
import class AppBase.PaymentViewModel

public struct CardInputProcessor: ICardInputProcessor {
    
    // MARK: - Card Fields
    
    public func validateCardNumber(_ field: inout CardInputViewModel.Field) {
        fatalError("Необходимо реализовать метод")
    }
    
    public func validateExpiryDate(_ field: inout CardInputViewModel.Field) {
        fatalError("Необходимо реализовать метод")
    }
    
    public func validateCVV(_ field: inout CardInputViewModel.Field) {
        fatalError("Необходимо реализовать метод")
    }
    
    // MARK: - Button State
    
    public func calculateButtonState(with viewModel: CardInputViewModel) -> PaymentViewModel.PaymentButtonState {
        fatalError("Необходимо реализовать метод")
    }
}
