//
//  ProfileSectionView.swift
//  PerioPresentation
//
//  Created by Uriel Barbosa Pinheiro on 17/04/26.
//

import SwiftUI
import PerioDesignSystem

struct ProfileSectionView: View {

    // MARK: - Private properties

    private let horizontalSpacing: CGFloat = 16
    private let profileColor: Color = PerioDesignSystemAsset.Habit.sage.swiftUIColor
    private let profileBorderWidth: CGFloat = 1.4
    private let profileOpacity: CGFloat = 0.3
    private let profileImageSize: CGFloat = 24
    private let profileBoxSize: CGFloat = 48
    private let internalPadding: CGFloat = 16
    private var viewModel: any ProfileViewModel

    // MARK: - Internal properties

    var body: some View {
        ZStack {
            CardView()
            HStack(alignment: .center, spacing: horizontalSpacing) {
                ZStack {
                    Circle()
                        .strokeBorder(profileColor, lineWidth: profileBorderWidth)
                        .background {
                            Circle().fill(profileColor.opacity(profileOpacity))
                        }
                    Image(asset: PerioDesignSystemAsset.Icons.person)
                        .resizable()
                        .frame(width: profileImageSize, height: profileImageSize)
                        .foregroundStyle(profileColor)
                }
                .frame(width: profileBoxSize, height: profileBoxSize)
                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .sheetTitleStyle()
                    Text(viewModel.subtitle)
                        .captionStyle()
                }
                Spacer()
            }
            .padding(.all, internalPadding)
        }
        .task {
            await viewModel.observeName()
        }
    }

    // MARK: - Init

    init(viewModel: any ProfileViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Preview

#Preview {
    ProfileSectionView(viewModel: StubProfileViewModel())
}
