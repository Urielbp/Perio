//
//  UserDefaultsAppearanceRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import Foundation
import PerioDomain

public final class UserDefaultsAppearanceRepository: AppearanceRepository {
    private let store: KeyValueStore
    private var continuations: [UUID: AsyncStream<AppearanceMode>.Continuation] = [:]

    public func setMode(_ mode: AppearanceMode) {
        store.set(mode, for: AppearanceMode.typeName)
        for continuation in continuations.values {
            continuation.yield(mode)
        }
    }

    public func observeMode() -> AsyncStream<AppearanceMode> {
        let id = UUID()
        return AsyncStream { continuation in
            self.continuations[id] = continuation
            continuation.yield(store.get(AppearanceMode.typeName) ?? .systemSelected)

            continuation.onTermination = { [weak self] _ in
                self?.continuations.removeValue(forKey: id)
            }
        }
    }

    public init(store: KeyValueStore) {
        self.store = store
    }
}
