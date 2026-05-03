//
//  OnboardingDI.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

import PerioData
import PerioDomain
import PerioPresentation

@MainActor
struct OnboardingDI {
    static func register() {
        DIRegistry.shared.bind(service: PreferredNameRepository.self) { resolver in
            UserDefaultsPreferredNameRepository(store: resolver.resolve(KeyValueStore.self))
        }

        DIRegistry.shared.bind(service: SetPreferredNameUseCase.self) { resolver in
            SetPreferredNameUseCaseImpl(repository: resolver.resolve(PreferredNameRepository.self))
        }

        DIRegistry.shared.bind(service: GetPreferredNameUseCase.self) { resolver in
            GetPreferredNameUseCaseImpl(repository: resolver.resolve(PreferredNameRepository.self))
        }
    }
}
