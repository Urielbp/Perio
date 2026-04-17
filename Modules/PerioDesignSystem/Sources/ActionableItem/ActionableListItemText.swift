//
//  ActionableListItemText.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 20/04/26.
//

import SwiftUI

public struct ActionableListItemText: View {
    
    // MARK: - Private properties
    
    private let chevronColor: Color = PerioDesignSystemAsset.Text.inkFaint.swiftUIColor
    
    // MARK: - Public properties
    
    public var text: String
    
    public var body: some View {
        Text(text)
            .bodyDescriptionStyle()
    }
    
    // MARK: - Init
    
    public init(_ text: String) {
        self.text = text
    }
}

extension ActionableListItem where RightContent == ActionableListItemText {
    static public func text(title: String,
                            action: @escaping () -> Void,
                            icon: PerioDesignSystemImages,
                            iconColor: PerioDesignSystemColors,
                            trailingText: String) -> Self {
        ActionableListItem(title: title,
                           action: action,
                           icon: icon,
                           iconColor: iconColor) {
            ActionableListItemText(trailingText)
        }
    }
}

#Preview {
    ActionableListItem.text(
        title: "Dark mode",
        action: {}, icon:
            PerioDesignSystemAsset.Icons.moon,
        iconColor: PerioDesignSystemAsset.Habit.rose,
        trailingText: "System")
    
}
