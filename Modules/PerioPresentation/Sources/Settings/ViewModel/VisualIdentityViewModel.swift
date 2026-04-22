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
    var appearenceOptions: [(label: String, mode: AppearanceMode)] { get }

    func selectAppearence(_ mode: AppearanceMode)
}

@Observable
@MainActor
final public class VisualIdentityViewModelImpl: VisualIdentityViewModel {

    // MARK: - Private properties

    private let setAppearenceUseCase: SetAppearanceModeUseCase
    private let getAppearenceUseCase: GetAppearanceModeUseCase
    private var getAppearanceCancellable: AnyCancellable?

    // MARK: - Public properties

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

    // MARK: - Init

    public init(
        setAppearenceUseCase: SetAppearanceModeUseCase,
        getAppearenceUseCase: GetAppearanceModeUseCase
    ) {
        self.setAppearenceUseCase = setAppearenceUseCase
        self.getAppearenceUseCase = getAppearenceUseCase

        setupSink()
    }

    // MARK: - Public functions

    public func selectAppearence(_ mode: PerioDomain.AppearanceMode) {
        setAppearenceUseCase.invoke(mode)
    }

    // MARK: - Private functions

    private func setupSink() {
        getAppearanceCancellable = getAppearenceUseCase.invoke()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] mode in
                self?.currentAppearance = mode
            }
    }
}
