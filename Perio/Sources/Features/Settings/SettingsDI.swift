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
        DIRegistry.shared.bind(service: AppearanceRepository.self) { resolver in
            UserDefaultsAppearanceRepository(store: resolver.resolve(KeyValueStore.self))
        }

        DIRegistry.shared.bind(service: SetAppearanceModeUseCase.self) { resolver in
            SetAppearanceModeUseCaseImpl(repository: resolver.resolve(AppearanceRepository.self))
        }

        DIRegistry.shared.bind(service: GetAppearanceModeUseCase.self) { resolver in
            GetAppearanceModeUseCaseImpl(repository: resolver.resolve(AppearanceRepository.self))
        }
    }
}
