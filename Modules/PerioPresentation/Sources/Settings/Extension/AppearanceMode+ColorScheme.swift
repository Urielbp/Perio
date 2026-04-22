//
//  AppearanceMode+ColorScheme.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 22/04/26.
//

import PerioDomain
import SwiftUI

public extension AppearanceMode {
    var colorScheme: ColorScheme? {
        switch self {
        case .systemSelected: nil
        case .lightMode: .light
        case .darkMode: .dark
        }
    }
}
