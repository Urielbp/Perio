//
//  TextfieldView.swift
//  PerioDesignSystem
//
//  Created by Uriel Barbosa Pinheiro on 27/04/26.
//

import SwiftUI

public struct TextfieldView: View {

    // MARK: - Private properties

    private let title: String
    private let dividerHeight: CGFloat = 3.0

    // MARK: - Public properties

    @Binding public var text: String

    public var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .sectionLabelStyle()
            TextField(String(), text: $text)
                .titleStyle()
                .foregroundStyle(PerioDesignSystemAsset.Text.ink.swiftUIColor)
                .tint(PerioDesignSystemAsset.Text.ink.swiftUIColor)
            Divider()
                .frame(height: dividerHeight)
                .overlay(PerioDesignSystemAsset.Habit.sage.swiftUIColor)
        }
    }

    // MARK: - Init

    public init(title: String, text: Binding<String>) {
        self.title = title
        self._text = text
    }
}

// MARK: - Preview

#Preview {
    TextfieldView(title: "YOUR NAME", text: .constant("Lea"))
}
