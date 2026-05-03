//
//  StubProfileViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 03/05/26.
//

#if DEBUG

import PerioDomain
import SwiftUI

@Observable
final class StubProfileViewModel: ProfileViewModel {
    var title: String {
        "Lea"
    }

    var subtitle: String {
        "tap to change yout name"
    }

    func observeName() async {

    }

    init() {

    }
}
#endif
