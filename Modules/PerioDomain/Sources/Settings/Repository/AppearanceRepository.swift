//
//  AppearanceRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

public protocol AppearanceRepository {
    func getCurrentMode() -> AppearanceMode
    func setMode(_ mode: AppearanceMode)
    func observeMode() -> AsyncStream<AppearanceMode>
}
