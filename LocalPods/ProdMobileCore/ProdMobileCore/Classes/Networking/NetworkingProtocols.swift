//
//  Protocols.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 12.02.2024.
//

import Foundation

public enum NetworkingError: Error {
    case notFound
    case invalidRequest
}

public protocol IRequest {
    /// Базовый путь до api
    var baseUrl: String { get }
    /// Конкретный метод api
    var methodPath: String { get }
    /// Параметры запроса
    var queryParams: [String: String] { get }
}

/// Сервис для совершения сетевых запросов
public protocol INetworkingService {
    /// Выполняет запрос и возвращает ответ api
    /// В качестве успешного результата возврщается Data тела ответа (например  JSON)
    func load(request: IRequest, _ completion: @escaping (_ json: Result<Data, Error>) -> ())
}
