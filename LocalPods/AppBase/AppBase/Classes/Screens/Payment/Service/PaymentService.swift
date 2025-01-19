//
//  PaymentService.swift
//  Pods
//
//  Created by m.titor on 10.01.2025.
//

final public class PaymentService: IPaymentService {
    
    // MARK: - Initialization
    
    public init() {}
    
    // MARK: - IPaymentService
    
    public func pay(withCardNumber cardNumber: String, expiryDate: String, cvv: String) {
        print("Совершена покупка с карты.\nНомер: \(cardNumber)\nСрок до: \(expiryDate)\nCVV: \(cvv)")
    }
}
