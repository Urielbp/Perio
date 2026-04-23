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
    @State private var appearanceModalShown: Bool = false

    var viewModel: any VisualIdentityViewModel

    var body: some View {
        ZStack {
            CardView()
            VStack {
                ActionableListItem.text(title: PerioPresentationStrings.Settings.VisualIdentity.Appearance.title,
                                        action: didTapChangeAppearance,
                                        icon: PerioDesignSystemAsset.Icons.moon,
                                        iconColor: PerioDesignSystemAsset.Habit.slate,
                                        trailingText: viewModel.currentAppearanceText)
                .confirmationDialog(PerioPresentationStrings.Settings.VisualIdentity.Appearance.title, isPresented: $appearanceModalShown) {
                    ForEach(viewModel.appearanceOptions, id: \.mode) { (label, mode) in
                        Button(label) {
                            viewModel.selectAppearance(mode)
                        }
                    }
                }
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

    func didTapChangeAppearance() {
        appearanceModalShown = true
    }

    init(viewModel: any VisualIdentityViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    VisualIdentitySectionView(viewModel: StubVisualIdentityViewModel())
}
