//
//  SettingsCoordinator.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import PerioDomain
import PerioPresentation
import SwiftUI

@MainActor
final class SettingsCoordinator {
    static func makeSettingsView() -> some View {
        let visualIdentityViewModel = VisualIdentityViewModelImpl(
            setAppearenceUseCase: DIRegistry.shared.resolve(SetAppearenceModeUseCase.self)
        )
        return SettingsView(visualIdentityViewModel: visualIdentityViewModel)
    }
}
