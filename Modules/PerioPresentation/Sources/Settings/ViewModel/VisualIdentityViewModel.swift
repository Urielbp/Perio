//
//  VisualIdentitySectionViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import SwiftUI
import PerioDomain
import Combine

@MainActor
public protocol VisualIdentityViewModel: Observable {
    var currentAppearance: AppearanceMode { get }
    var currentAppearanceText: String { get }
    var appearanceOptions: [(label: String, mode: AppearanceMode)] { get }

    func selectAppearance(_ mode: AppearanceMode)
}

@Observable
@MainActor
final public class VisualIdentityViewModelImpl: VisualIdentityViewModel {

    // MARK: - Private properties

    private let setAppearanceUseCase: SetAppearanceModeUseCase
    private let getAppearanceUseCase: GetAppearanceModeUseCase
    private var getAppearanceCancellable: AnyCancellable?

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

        setupSink()
    }

    // MARK: - Public functions

    public func selectAppearance(_ mode: PerioDomain.AppearanceMode) {
        setAppearanceUseCase.invoke(mode)
    }

    // MARK: - Private functions

    private func setupSink() {
        getAppearanceCancellable = getAppearanceUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mode in
                self?.currentAppearance = mode
            }
    }
}
