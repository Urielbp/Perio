//
//  OnboardingViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

import PerioDomain
import SwiftUI

@MainActor
public protocol OnboardingViewModel: Observable {
    var preferredNameBinding: Binding<String> { get }

    func setPreferredName()
    func skipNameChoice()
}

@Observable
@MainActor
final public class OnboardingViewModelImpl: OnboardingViewModel {

    // MARK: - Private properties

    private var preferredName: String = String()
    private let setPreferredNameUseCase: SetPreferredNameUseCase
    private let onboardingFinishedCallback: (() -> Void)

    // MARK: - Public properties

    public var preferredNameBinding: Binding<String> {
        Binding(
            get: { self.preferredName },
            set: { self.preferredName = $0 }
        )
    }

    // MARK: - Init

    public init(
        setPreferredNameUseCase: SetPreferredNameUseCase,
        onboardingFinishedCallback: @escaping (() -> Void)
    ) {
        self.setPreferredNameUseCase = setPreferredNameUseCase
        self.onboardingFinishedCallback = onboardingFinishedCallback
    }

    // MARK: - Public functions

    public func setPreferredName() {
        setPreferredNameUseCase.invoke(preferredName)
        onboardingFinishedCallback()
    }

    public func skipNameChoice() {
        onboardingFinishedCallback()
    }
}
