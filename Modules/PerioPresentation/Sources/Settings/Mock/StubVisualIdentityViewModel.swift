//
//  StubVisualIdentityViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

#if DEBUG

import PerioDomain
import SwiftUI

@Observable
final class StubVisualIdentityViewModel: VisualIdentityViewModel {
    let currentAppearance: AppearanceMode = .darkMode

    let currentAppearanceText: String = "Dark mode"

    let appearanceOptions: [(label: String, mode: AppearanceMode)] =
    [
        ("System", .systemSelected),
        ("Dark mode", .darkMode),
        ("Light mode", .lightMode)
    ]
    
    func selectAppearance(_ mode: AppearanceMode) {
        
    }

    func observeAppearence() async {

    }

    init() {

    }
}
#endif
