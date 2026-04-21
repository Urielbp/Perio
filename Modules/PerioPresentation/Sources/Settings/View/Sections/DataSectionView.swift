//
//  DataSectionView.swift
//  PerioPresentation
//
//  Created by Uriel Barbosa Pinheiro on 17/04/26.
//

import SwiftUI
import PerioDesignSystem

struct DataSectionView: View {

    private let internalPadding: CGFloat = 16
    private let dividerHeight: CGFloat = 0.5 // TODO: put on the DS

    var body: some View {
        ZStack {
            CardView()
            VStack {
                ActionableListItem.chevron(title: PerioPresentationStrings.Settings.DataAndPrivacy.export,
                                           action: {},
                                           icon: PerioDesignSystemAsset.Icons.list,
                                           iconColor: PerioDesignSystemAsset.Habit.teal)
                Divider()
                    .foregroundStyle(PerioDesignSystemAsset.Foundation.hairline.swiftUIColor)
                    .frame(height: dividerHeight)
                ActionableListItem.chevron(title: PerioPresentationStrings.Settings.DataAndPrivacy.reset,
                                           action: {},
                                           icon: PerioDesignSystemAsset.Icons.trash,
                                           iconColor: PerioDesignSystemAsset.Habit.clay)
            }
            .padding(.all, internalPadding)
        }
    }
}

#Preview {
    DataSectionView()
}
