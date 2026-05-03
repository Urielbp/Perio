//
//  UserDefaultsPreferredNameRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

import Foundation
import PerioDomain

public final class UserDefaultsPreferredNameRepository: PreferredNameRepository {

    private let storeKey: String = "PreferredName"
    private let store: KeyValueStore
    private var continuations: [UUID: AsyncStream<String?>.Continuation] = [:]

    public func setName(_ name: String) {
        store.set(name, for: storeKey)
        for continuation in continuations.values {
            continuation.yield(name)
        }
    }

    public func observeName() -> AsyncStream<String?> {
        let id = UUID()
        return AsyncStream { continuation in
            self.continuations[id] = continuation
            continuation.yield(store.get(storeKey))

            continuation.onTermination = { [weak self] _ in
                self?.continuations.removeValue(forKey: id)
            }
        }
    }

    public init(store: KeyValueStore) {
        self.store = store
    }
}
