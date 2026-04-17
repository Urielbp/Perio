//
//  VisualIdentitySectionView.swift
//  PerioPresentation
//
//  Created by Uriel Barbosa Pinheiro on 16/04/26.
//

import SwiftUI
import PerioDesignSystem

struct VisualIdentitySectionView: View {

    private let internalPadding: CGFloat = 16
    private let dividerHeight: CGFloat = 0.5 // TODO: put on the DS

    var body: some View {
        ZStack {
            CardView()
            VStack {
                ActionableListItem.text(title: PerioPresentationStrings.Settings.VisualIdentity.Appearence.title,
                                        action: {},
                                        icon: PerioDesignSystemAsset.Icons.moon,
                                        iconColor: PerioDesignSystemAsset.Habit.slate,
                                        trailingText: PerioPresentationStrings.Settings.VisualIdentity.Appearence.system)
                Divider()
                    .foregroundStyle(PerioDesignSystemAsset.Foundation.hairline.swiftUIColor)
                    .frame(height: dividerHeight)
                ActionableListItem.chevron(title: PerioPresentationStrings.Settings.VisualIdentity.appIcon,
                                           action: {},
                                           icon: PerioDesignSystemAsset.Icons.flower,
                                           iconColor: PerioDesignSystemAsset.Habit.rose)
            }
            .padding(.all, internalPadding)
        }
    }

    func didChangeColor(index: Int) {

    }
}

#Preview {
    VisualIdentitySectionView()
}
