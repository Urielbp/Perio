//
//  ActionableListItem.swift
//  PerioDesignSystem
//
//  Created by Uriel Barbosa Pinheiro on 17/04/26.
//

import SwiftUI

public struct ActionableListItem<RightContent: View>: View {

    // MARK: - Private properties

    private let chevronIcon: PerioDesignSystemImages = PerioDesignSystemAsset.Icons.chevron
    private let chevronColor: Color = PerioDesignSystemAsset.Text.inkFaint.swiftUIColor
    private let iconBoxCornerRadiusSize: CGSize = CGSize(width: 10, height: 10)
    private let iconBoxSize: CGFloat = 32
    private let iconBoxOpacity: CGFloat = 0.3

    // MARK: - Public properties

    public var title: String
    public var action: (() -> Void)
    public var icon: PerioDesignSystemImages
    public var iconColor: PerioDesignSystemColors
    public var rightContent: () -> RightContent

    public var body: some View {
        Button {
            action()
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerSize: iconBoxCornerRadiusSize)
                        .frame(width: iconBoxSize, height: iconBoxSize)
                        .foregroundStyle(iconColor.swiftUIColor.opacity(iconBoxOpacity))
                    Image(asset: icon)
                        .foregroundStyle(iconColor.swiftUIColor)
                }
                Text(title)
                    .listItemStyle()
                Spacer()
                rightContent()
            }
        }
    }

    // MARK: - Init

    public init(title: String,
                action: @escaping () -> Void,
                icon: PerioDesignSystemImages,
                iconColor: PerioDesignSystemColors,
                rightContent: @escaping () -> RightContent) {
        self.title = title
        self.action = action
        self.icon = icon
        self.iconColor = iconColor
        self.rightContent = rightContent
    }
}

// MARK: - Preview

#Preview {
    VStack {
        ActionableListItem.chevron(
            title: "Export",
            action: {},
            icon: PerioDesignSystemAsset.Icons.list,
            iconColor: PerioDesignSystemAsset.Habit.teal)
        ActionableListItem.toggle(
            title: "Daily reminders",
            action: {},
            icon: PerioDesignSystemAsset.Icons.list,
            iconColor: PerioDesignSystemAsset.Habit.teal,
            isOn: true
        )
        ActionableListItem.text(
            title: "Dark mode",
            action: {},
            icon: PerioDesignSystemAsset.Icons.moon,
            iconColor: PerioDesignSystemAsset.Habit.rose,
            trailingText: "System")
    }
}
