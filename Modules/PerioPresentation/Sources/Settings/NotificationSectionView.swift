//
//  NotificationSectionView.swift
//  PerioPresentation
//
//  Created by Uriel Barbosa Pinheiro on 20/04/26.
//

import SwiftUI
import PerioDesignSystem

struct NotificationSectionView: View {
    private let internalPadding: CGFloat = 16
    private let dividerHeight: CGFloat = 0.5 // TODO: put on the DS

    var body: some View {
        ZStack {
            CardView()
            VStack {
                ActionableListItem.toggle(title: PerioPresentationStrings.Settings.Notifications.dailyReminders,
                                          action: {},
                                          icon: PerioDesignSystemAsset.Icons.bell,
                                          iconColor: PerioDesignSystemAsset.Habit.sage,
                                          isOn: true)
                Divider()
                    .foregroundStyle(PerioDesignSystemAsset.Foundation.hairline.swiftUIColor)
                    .frame(height: dividerHeight)
                ActionableListItem.text(title: PerioPresentationStrings.Settings.Notifications.defaultTime,
                                        action: {},
                                        icon: PerioDesignSystemAsset.Icons.clock,
                                        iconColor: PerioDesignSystemAsset.Habit.sand,
                                        trailingText: PerioPresentationStrings.Settings.Notifications.defaultValue)
            }
            .padding(.all, internalPadding)
        }
    }
}

#Preview {
    NotificationSectionView()
}
