//
//  UserDefaultsAppearanceRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import Combine
import Foundation
import PerioDomain

public final class UserDefaultsAppearanceRepository: AppearanceRepository {
    private let store: KeyValueStore
    private let subject: CurrentValueSubject<AppearanceMode, Never>

    public func getCurrentMode() -> AppearanceMode {
        subject.value
    }

    public func setMode(_ mode: AppearanceMode) {
        store.set(mode, for: AppearanceMode.typeName)
        subject.send(mode)
    }

    public func observeMode() -> AnyPublisher<AppearanceMode, Never> {
        subject
            .removeDuplicates()
            .eraseToAnyPublisher()
    }

    public init(store: KeyValueStore) {
        self.store = store
        let initial: AppearanceMode = store.get(AppearanceMode.typeName) ?? .systemSelected
        self.subject = CurrentValueSubject(initial)
    }
}
