//
//  SettingsView.swift
//  PerioPresentation
//
//  Created by Uriel Barbosa Pinheiro on 16/04/26.
//

import SwiftUI
import PerioDesignSystem

public struct SettingsView: View {

    private let verticalSectionInterSectionSpacing: CGFloat = 8.0
    private let verticalSectionSectionSpacing: CGFloat = 16.0
    private let horizontalSpacing: CGFloat = 16.0

    var visualIdentityViewModel: any VisualIdentityViewModel

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: verticalSectionSectionSpacing) {
                Text(PerioPresentationStrings.Settings.title)
                    .titleStyle()
                buildSection(title: PerioPresentationStrings.Settings.Profile.title, ProfileSectionView())
                buildSection(title: PerioPresentationStrings.Settings.Notifications.title, NotificationSectionView())
                buildSection(title: PerioPresentationStrings.Settings.VisualIdentity.title, VisualIdentitySectionView(viewModel: visualIdentityViewModel))
                buildSection(title: PerioPresentationStrings.Settings.DataAndPrivacy.title, DataSectionView())
            }
            .padding(.horizontal, horizontalSpacing)
        }
        .background {
            PerioDesignSystemAsset.Foundation.background.swiftUIColor.ignoresSafeArea()
        }
    }

    func buildSection(title: String, _ view: some View) -> some View {
        VStack(alignment: .leading, spacing: verticalSectionInterSectionSpacing) {
            Text(title)
                .sectionLabelStyle()
            view
        }
    }

    public init(visualIdentityViewModel: any VisualIdentityViewModel) {
        self.visualIdentityViewModel = visualIdentityViewModel
    }
}

#Preview {
    SettingsView(visualIdentityViewModel: StubVisualIdentityViewModel())
}
