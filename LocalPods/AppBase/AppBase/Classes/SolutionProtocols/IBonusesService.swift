//
//  IBonusesService.swift
//  AppBase
//
//  Created by Arina Kolganova on 09.01.2025.
//

import Foundation

public protocol IBonusesService: AnyObject {
    func loadBonuses(completion: @escaping (Result<[Bonus], Error>) -> Void)
}
