//
//  OnboardingCoordinator.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

import PerioDomain
import PerioPresentation
import SwiftUI

@Observable
@MainActor
final class OnboardingCoordinator {

    var hasCompletedOnboarding: Bool = false

    func makeOnboardingView() -> some View {
        let onboardingViewModel = OnboardingViewModelImpl(
            setPreferredNameUseCase: DIRegistry.shared.resolve(SetPreferredNameUseCase.self),
            onboardingFinishedCallback: { [weak self] in
                self?.hasCompletedOnboarding = true
            }
        )
        return OnboardingView(viewModel: onboardingViewModel)
    }
}
