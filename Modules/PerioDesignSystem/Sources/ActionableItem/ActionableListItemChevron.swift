//
//  ActionableListItemChevron.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 20/04/26.
//

import SwiftUI

public struct ActionableListItemChevron: View {
    
    // MARK: - Private properties
    
    private let chevronIcon: PerioDesignSystemImages = PerioDesignSystemAsset.Icons.chevron
    private let chevronColor: Color = PerioDesignSystemAsset.Text.inkFaint.swiftUIColor
    
    // MARK: - Public properties
    
    public var body: some View {
        Image(asset: chevronIcon)
            .foregroundStyle(chevronColor)
    }
    
    // MARK: - Init
    
    public init() {
        
    }
}

extension ActionableListItem where RightContent == ActionableListItemChevron {
    static public func chevron(title: String,
                               action: @escaping () -> Void,
                               icon: PerioDesignSystemImages,
                               iconColor: PerioDesignSystemColors) -> Self {
        ActionableListItem(title: title, action: action, icon: icon, iconColor: iconColor) {
            ActionableListItemChevron()
        }
    }
}

#Preview {
    ActionableListItem.chevron(
        title: "Export",
        action: {},
        icon: PerioDesignSystemAsset.Icons.list,
        iconColor: PerioDesignSystemAsset.Habit.teal)
}
