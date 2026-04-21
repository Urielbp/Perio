//
//  SettingsDI.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import PerioData
import PerioDomain
import PerioPresentation

@MainActor
struct SettingsDI {
    static func register() {
        DIRegistry.shared.bind(service: KeyValueStore.self) { _ in
            UserDefaultsKeyValueStore()
        }

        DIRegistry.shared.bind(service: AppearanceRepository.self) { resolver in
            UserDefaultsAppearenceRepository(store: resolver.resolve(KeyValueStore.self))
        }

        DIRegistry.shared.bind(service: SetAppearenceModeUseCase.self) { resolver in
            SetAppearenceModeUseCaseImpl(repository: resolver.resolve(AppearanceRepository.self))
        }
    }
}
