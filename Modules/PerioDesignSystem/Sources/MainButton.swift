//
//  MainButton.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 27/04/26.
//

import SwiftUI

public struct MainButtonStyle: ButtonStyle {

    private let cornerRadius: CGSize = .init(width: 16.0, height: 16.0)

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .modifier(ListItemStyle())
            .padding()
            .background(PerioDesignSystemAsset.Habit.sage.swiftUIColor)
            .foregroundStyle( PerioDesignSystemAsset.Text.ink.swiftUIColor)
            .clipShape(RoundedRectangle(cornerSize: cornerRadius))
    }

    public init() { }
}

#Preview {
    Button("Continue") {
        print("Button pressed!")
    }
    .buttonStyle(MainButtonStyle())
}
