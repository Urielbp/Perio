//
//  AppearanceRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import Combine

public protocol AppearanceRepository {
    func getCurrentMode() -> AppearanceMode
    func setMode(_ mode: AppearanceMode)
    func observeMode() -> AnyPublisher<AppearanceMode, Never>
}
