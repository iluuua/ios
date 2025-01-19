//
//  ICardInputValidator.swift
//  Pods
//
//  Created by m.titor on 07.01.2025.
//

public protocol ICardInputProcessor {
    
    /// Функция для валидации введённых пользователём данных банковской карты: номер карты
    func validateCardNumber(_ field: inout CardInputViewModel.Field)
    /// Функция для валидации введённых пользователём данных банковской карты: срок действия
    func validateExpiryDate(_ field: inout CardInputViewModel.Field)
    /// Функция для валидации введённых пользователём данных банковской карты: CVV код
    func validateCVV(_ field: inout CardInputViewModel.Field)
    
    /// Функция для вычисления состояния кнопки оплаты в зависимости от входных данных
    func calculateButtonState(with viewModel: CardInputViewModel) -> PaymentViewModel.PaymentButtonState
}
