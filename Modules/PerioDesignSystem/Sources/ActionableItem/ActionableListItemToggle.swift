//
//  ActionableListItemToggle.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 20/04/26.
//

import SwiftUI

public struct ActionableListItemToggle: View {

    // MARK: - Private properties

    private let switchColor: Color = PerioDesignSystemAsset.Habit.sage.swiftUIColor
    @State private var state: Bool = true

    // MARK: - Public properties

    public var isOn: Bool

    public var body: some View {
        Toggle(String(), isOn: $state)
            .tint(switchColor)
            .labelsHidden()
    }

    // MARK: - Init

    public init(_ isOn: Bool) {
        self.isOn = isOn
    }
}

extension ActionableListItem where RightContent == ActionableListItemToggle {
    static public func toggle(title: String,
                              action: @escaping () -> Void,
                              icon: PerioDesignSystemImages,
                              iconColor: PerioDesignSystemColors,
                              isOn: Bool) -> Self {
        ActionableListItem(title: title,
                           action: action,
                           icon: icon,
                           iconColor: iconColor) {
            ActionableListItemToggle(isOn)
        }
    }
}

#Preview {
    ActionableListItem.toggle(
        title: "Export",
        action: {},
        icon: PerioDesignSystemAsset.Icons.list,
        iconColor: PerioDesignSystemAsset.Habit.teal,
        isOn: true
    )
}
