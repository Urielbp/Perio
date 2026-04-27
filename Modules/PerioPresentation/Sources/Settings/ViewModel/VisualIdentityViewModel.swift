//
//  VisualIdentitySectionViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import SwiftUI
import PerioDomain

@MainActor
public protocol VisualIdentityViewModel: Observable {
    var currentAppearance: AppearanceMode { get }
    var currentAppearanceText: String { get }
    var appearanceOptions: [(label: String, mode: AppearanceMode)] { get }

    func selectAppearance(_ mode: AppearanceMode)
    func observeAppearence() async
}

@Observable
@MainActor
final public class VisualIdentityViewModelImpl: VisualIdentityViewModel {

    // MARK: - Private properties

    private let setAppearanceUseCase: SetAppearanceModeUseCase
    private let getAppearanceUseCase: GetAppearanceModeUseCase

    // MARK: - Public properties

    public var currentAppearance: AppearanceMode = .systemSelected

    public var currentAppearanceText: String {
        switch currentAppearance {
        case .systemSelected:
            PerioPresentationStrings.Settings.VisualIdentity.Appearance.system
        case .darkMode:
            PerioPresentationStrings.Settings.VisualIdentity.Appearance.darkMode
        case .lightMode:
            PerioPresentationStrings.Settings.VisualIdentity.Appearance.lightMode
        }
    }

    public var appearanceOptions: [(label: String, mode: AppearanceMode)] {
        [
            (PerioPresentationStrings.Settings.VisualIdentity.Appearance.system, .systemSelected),
            (PerioPresentationStrings.Settings.VisualIdentity.Appearance.darkMode, .darkMode),
            (PerioPresentationStrings.Settings.VisualIdentity.Appearance.lightMode, .lightMode)
        ]
    }

    // MARK: - Init

    public init(
        setAppearanceUseCase: SetAppearanceModeUseCase,
        getAppearanceUseCase: GetAppearanceModeUseCase
    ) {
        self.setAppearanceUseCase = setAppearanceUseCase
        self.getAppearanceUseCase = getAppearanceUseCase

    }

    // MARK: - Public functions

    public func selectAppearance(_ mode: PerioDomain.AppearanceMode) {
        setAppearanceUseCase.invoke(mode)
    }

    public func observeAppearence() async {
        for await mode in getAppearanceUseCase.invoke() {
            currentAppearance = mode
        }
    }
}
