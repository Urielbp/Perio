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
    @State private var appearenceModalShown: Bool = false

    var viewModel: any VisualIdentityViewModel

    var body: some View {
        ZStack {
            CardView()
            VStack {
                ActionableListItem.text(title: PerioPresentationStrings.Settings.VisualIdentity.Appearence.title,
                                        action: didTapChangeAppearence,
                                        icon: PerioDesignSystemAsset.Icons.moon,
                                        iconColor: PerioDesignSystemAsset.Habit.slate,
                                        trailingText: viewModel.currentAppearanceText)
                .confirmationDialog(PerioPresentationStrings.Settings.VisualIdentity.Appearence.title, isPresented: $appearenceModalShown) {
                    ForEach(viewModel.appearenceOptions, id: \.mode) { (label, mode) in
                        Button(label) {
                            viewModel.selectAppearence(mode)
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

    func didTapChangeAppearence() {
        appearenceModalShown = true
    }

    init(viewModel: any VisualIdentityViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    VisualIdentitySectionView(viewModel: StubVisualIdentityViewModel())
}
