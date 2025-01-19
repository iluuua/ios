//
//  Protocols.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 12.02.2024.
//

import Foundation

/// Локальное хранилище
public protocol IPersistenceStorage {
    /// Сохраняет объект конкретного типа по его идентификатору
    func save<Model: Identifiable>(_ item: Model)
    /// Возвращает все сохраненные объекты указанного типа
    func fetch<Model: Identifiable>(_ itemType: Model.Type) -> [Model]
    /// Удаляет объект, если он есть в хранилище
    func delete<Model: Identifiable>(_ item: Model)
}

/// Протокол модели, которую можно идентифицировать по уникальному полю
public protocol Identifiable {
    var identifier: String { get }
}
