//
//  IGoodsService.swift
//  Solution
//
//  Created by a yatsenko on 23.12.2024.
//

import Foundation

public protocol IGoodsService: AnyObject {
    func loadGoods(completion: @escaping (Result<[Product], Error>) -> Void)
}
