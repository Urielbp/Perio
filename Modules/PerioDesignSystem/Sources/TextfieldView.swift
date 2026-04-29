//
//  TextfieldView.swift
//  PerioDesignSystem
//
//  Created by Uriel Barbosa Pinheiro on 27/04/26.
//

import SwiftUI

public struct TextfieldView: View {

    private let title: String
    private let dividerHeight: CGFloat = 3.0
    @State var text: String = String()

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

    public init(title: String) {
        self.title = title
    }
}

#Preview {
    TextfieldView(title: "YOUR NAME")
}
