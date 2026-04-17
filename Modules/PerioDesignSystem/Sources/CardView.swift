//
//  CardView.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 16/04/26.
//

import SwiftUI

public struct CardView: View {

    // MARK: - Private properties

    private let cornerRadius: CGFloat = 16
    private let backgroundColor: Color = PerioDesignSystemAsset.Foundation.card.swiftUIColor

    // MARK: - Public properties

    public var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .foregroundStyle(backgroundColor)
    }

    // MARK: - Init

    public init() {

    }
}

// MARK: - Preview

#Preview {
    CardView()
}
