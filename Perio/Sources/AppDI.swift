//
//  AppDI.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 22/04/26.
//

@MainActor
struct AppDI {
    static func registerAll() {
        InfrastructureDI.register()
        SettingsDI.register()
    }
}
