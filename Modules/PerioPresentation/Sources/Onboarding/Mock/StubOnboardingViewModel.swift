//
//  StubOnboardingViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

#if DEBUG

import PerioDomain
import SwiftUI

@Observable
final class StubOnboardingViewModel: OnboardingViewModel {
    func skipNameChoice() {

    }
    
    var preferredNameBinding: Binding<String> {
        Binding(
            get: { String() },
            set: { _ in return }
        )
    }

    func setPreferredName() {

    }
}
#endif
