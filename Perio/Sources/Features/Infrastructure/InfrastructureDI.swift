//
//  InfrastructureDI.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 22/04/26.
//

import PerioData

@MainActor
struct InfrastructureDI {
    static func register() {
        DIRegistry.shared.bind(service: KeyValueStore.self) { _ in
            UserDefaultsKeyValueStore()
        }
    }
}
