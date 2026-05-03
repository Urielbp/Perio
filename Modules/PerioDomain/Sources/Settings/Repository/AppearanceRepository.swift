//
//  AppearanceRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

public protocol AppearanceRepository {
    func setMode(_ mode: AppearanceMode)
    func observeMode() -> AsyncStream<AppearanceMode>
}
