//
//  SecondaryButton.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

import SwiftUI

public struct SecondaryButton: ButtonStyle {

    // MARK: - Public functions

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ListItemStyle())
            .padding()
            .foregroundStyle( PerioDesignSystemAsset.Text.inkMuted.swiftUIColor)
    }

    // MARK: - Init

    public init() { }
}

// MARK: - Preview

#Preview {
    Button("Skip for now") {
        print("Button pressed!")
    }
    .buttonStyle(SecondaryButton())
}
