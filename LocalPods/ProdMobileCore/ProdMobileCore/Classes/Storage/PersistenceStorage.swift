//
//  PersistenceStorage.swift
//  ProdMobileCore
//
//  Created by Kuznetsov Mikhail on 12.02.2024.
//

import Foundation

public final class PersistenceStorage: IPersistenceStorage {

    private let inMemoryCash = InMemoryCash.shared

    private lazy var fakeCash: IFakeCash = inMemoryCash

    // MARK: - Init

    public init() {}

    // MARK: - Public

    public func save<Model>(_ item: Model) where Model: Identifiable {
        fakeCash.add(modelName: modelName(Model.self), id: item.identifier, item: item)
    }

    public func fetch<Model>(_ itemType: Model.Type) -> [Model] where Model: Identifiable {
        (fakeCash.read(modelName: modelName(Model.self)) as? [Model]) ?? []
    }

    public func delete<Model>(_ item: Model) where Model: Identifiable {
        fakeCash.remove(modelName: modelName(Model.self), id: item.identifier)
    }

    // MARK: - Private

    private func modelName<Model>(_ itemType: Model.Type) -> String {
        String(describing: Model.self)
    }

}

protocol IFakeCash {
    func read(modelName: String) -> [Any]
    func remove(modelName: String, id: String)
    func add(modelName: String, id: String, item: Any)
}


final class InMemoryCash: IFakeCash {
    static let shared = InMemoryCash()

    private var cash = [String: [String: Any]]()

    func read(modelName: String) -> [Any] {
        Array((cash[modelName] ?? [:]).values)
    }

    func remove(modelName: String, id: String) {
        cash[modelName]?.removeValue(forKey: id)
    }

    func add(modelName: String, id: String, item: Any) {
        if cash[modelName] == nil { cash[modelName] = [:] }

        cash[modelName]?[id] = item
    }
}
