//
//  AppAppearanceState.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import Combine
import PerioDomain
import SwiftUI

@Observable
@MainActor
final class AppAppearanceState {
    private let getAppearanceUseCase: GetAppearanceModeUseCase
    private var cancellable: AnyCancellable?
    var currentMode: AppearanceMode = .systemSelected

    init(getAppearanceUseCase: GetAppearanceModeUseCase) {
        self.getAppearanceUseCase = getAppearanceUseCase

        startObserving()
    }

    func startObserving() {
        cancellable = getAppearanceUseCase.invoke().receive(on: DispatchQueue.main)
            .sink { [weak self] mode in
                self?.currentMode = mode
            }
    }
}
