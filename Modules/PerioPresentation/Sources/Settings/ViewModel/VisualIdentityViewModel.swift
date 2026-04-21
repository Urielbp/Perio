//
//  VisualIdentitySectionViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import SwiftUI
import PerioDomain

extension AppearanceMode {
    var colorScheme: ColorScheme? {
        switch self {
        case .systemSelected: nil
        case .lightMode: .light
        case .darkMode: .dark
        }
    }
}

@MainActor
public protocol VisualIdentityViewModel: Observable {
    var currentAppearance: AppearanceMode { get }
    var currentAppearanceText: String { get }
    var appearenceOptions: [(label: String, mode: AppearanceMode)] { get }

    func selectAppearence(_ mode: AppearanceMode)
}

@Observable
@MainActor
final public class VisualIdentityViewModelImpl: VisualIdentityViewModel {

    private let setAppearenceUseCase: SetAppearenceModeUseCase

    public var currentAppearance: AppearanceMode = .systemSelected

    public var currentAppearanceText: String {
        switch currentAppearance {
        case .systemSelected:
            PerioPresentationStrings.Settings.VisualIdentity.Appearence.system
        case .darkMode:
            PerioPresentationStrings.Settings.VisualIdentity.Appearence.darkMode
        case .lightMode:
            PerioPresentationStrings.Settings.VisualIdentity.Appearence.lightMode
        }
    }

    public var appearenceOptions: [(label: String, mode: AppearanceMode)] {
        [
            (PerioPresentationStrings.Settings.VisualIdentity.Appearence.system, .systemSelected),
            (PerioPresentationStrings.Settings.VisualIdentity.Appearence.darkMode, .darkMode),
            (PerioPresentationStrings.Settings.VisualIdentity.Appearence.lightMode, .lightMode)
        ]
    }

    public func selectAppearence(_ mode: PerioDomain.AppearanceMode) {
        currentAppearance = mode
        setAppearenceUseCase.invoke(mode)
    }

    public init(setAppearenceUseCase: SetAppearenceModeUseCase) {
        self.setAppearenceUseCase = setAppearenceUseCase
    }

}
