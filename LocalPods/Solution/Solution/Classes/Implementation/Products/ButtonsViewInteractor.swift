//
//  ButtonsViewInteractor.swift
//  Pods
//
//  Created by Kuznetsov Mikhail on 15.01.2025.
//

import AppBase

class ButtonsViewInteractionModel: IButtonsViewInteractionModel {
    let productId: String
    let cartService: ICartService
    
    init(productId: String, cartService: ICartService) {
        self.productId = productId
        self.cartService = cartService
    }
    
    var quantity: Int {
        fatalError("Необходимо реализовать метод")
    }
    
    func onPressedAdd() {
        fatalError("Необходимо реализовать метод")
    }
    
    func onPressedRemove() {
        fatalError("Необходимо реализовать метод")
    }
}
