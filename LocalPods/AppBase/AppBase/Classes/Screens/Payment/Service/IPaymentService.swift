//
//  IPaymentService.swift
//  Pods
//
//  Created by m.titor on 10.01.2025.
//

/// Фейковый сервис оплаты
public protocol IPaymentService: AnyObject {
    
    /// Фейковая функция обработки платежа
    func pay(withCardNumber cardNumber: String, expiryDate: String, cvv: String)
}
