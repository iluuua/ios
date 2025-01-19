//
//  PaymentPresenter.swift
//  AppBase
//
//  Created by m.titor on 21.12.2024.
//

import Foundation

public protocol IPaymentPresenter: AnyObject {

    var view: IPaymentView? { get set }

    func didUpdateField(_ model: CardInputViewModel)
    func paymentButtonDidPressed(_ model: CardInputViewModel)
}

public final class PaymentPresenter: IPaymentPresenter {

    // Dependencies
    weak public var view: IPaymentView?
    private let processor: ICardInputProcessor
    private let paymentService: IPaymentService

    // MARK: - Initialization
    
    public init(processor: ICardInputProcessor, paymentService: IPaymentService) {
        self.processor = processor
        self.paymentService = paymentService
    }

    // MARK: - IPaymentPresenter

    public func didUpdateField(_ model: CardInputViewModel) {
        processor.validateCardNumber(&model.cardNumber)
        processor.validateExpiryDate(&model.expiryDate)
        processor.validateCVV(&model.cvv)
        
        let buttonState = processor.calculateButtonState(with: model)

        view?.update(model: PaymentViewModel(cardInputViewModel: model, buttonState: buttonState))
    }
    
    public func paymentButtonDidPressed(_ model: CardInputViewModel) {
        paymentService.pay(withCardNumber: model.cardNumber.unwrap(), expiryDate: model.expiryDate.unwrap(), cvv: model.cvv.unwrap())
    }
}
