//
//  IUserInfoService.swift
//  AppBase
//
//  Created by a yatsenko on 07.01.2025.
//

import Foundation

public protocol IUserInfoService: AnyObject {
    func loadUserInfo(completion: @escaping (Result<UserInfo, Error>) -> Void)
}
