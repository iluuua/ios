//
//  IPaymentCartService.swift
//  AppBase
//
//  Created by Arina Kolganova on 15.01.2025.
//

public protocol IPaymentCartService: AnyObject {
    func buy(ids: [String], cost: Double)
}
