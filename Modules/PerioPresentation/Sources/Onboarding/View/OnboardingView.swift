//
//  OnboardingView.swift
//  PerioPresentation
//
//  Created by Uriel Barbosa Pinheiro on 27/04/26.
//

import PerioDesignSystem
import SwiftUI

public struct OnboardingView: View {

    private let gradientColor: Color = PerioDesignSystemAsset.Habit.clay.swiftUIColor.opacity(0.15)
    private let gradientCenter: UnitPoint = .init(x: 0.7, y: 0)
    private let radiusStartSize: CGFloat = 1
    private let radiusEndSize: CGFloat = 300
    private let verticalSpacing: CGFloat = 32.0
    private let topSpacing: CGFloat = 120.0
    private let iconBoxCornerRadiusSize: CGSize = CGSize(width: 10, height: 10)
    private let iconBoxSize: CGFloat = 48
    private let iconColor: Color = PerioDesignSystemAsset.Habit.sage.swiftUIColor
    private let iconBoxOpacity: CGFloat = 0.3
    private let iconSize: CGFloat = 24
    private let lineSpacing: CGFloat = 8.0
    private let textfieldSpacing: CGFloat = 28.0
    private let horizontalSpacing: CGFloat = 16.0

    public var viewModel: OnboardingViewModel

    public var body: some View {
        ZStack {
            RadialGradient(colors: [gradientColor, .clear],
                           center: gradientCenter,
                           startRadius: radiusStartSize,
                           endRadius: radiusEndSize)
            .ignoresSafeArea(.all)
            VStack(alignment: .leading) {
                Spacer()
                    .frame(maxWidth: .infinity)
                    .frame(height: topSpacing)
                ZStack {
                    RoundedRectangle(cornerSize: iconBoxCornerRadiusSize)
                        .frame(width: iconBoxSize, height: iconBoxSize)
                        .foregroundStyle(iconColor.opacity(iconBoxOpacity))
                    Image(asset: PerioDesignSystemAsset.Icons.sprout)
                        .resizable()
                        .scaledToFit()
                        .frame(width: iconSize, height: iconSize)
                        .foregroundStyle(iconColor)
                }
                Text(PerioPresentationStrings.Onboarding.title)
                    .titleStyle()
                    .lineSpacing(lineSpacing)
                Spacer()
                    .frame(maxWidth: .infinity)
                    .frame(height: verticalSpacing)
                Text(PerioPresentationStrings.Onboarding.subtitle)
                    .bodyDescriptionStyle()
                    .lineSpacing(lineSpacing)
                Spacer()
                    .frame(height: textfieldSpacing)
                TextfieldView(title: PerioPresentationStrings.Onboarding.Textfield.title, text: viewModel.preferredNameBinding)
                Spacer()
                Button {
                    viewModel.setPreferredName()
                } label: {
                    Text(PerioPresentationStrings.Onboarding.mainButton)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(MainButtonStyle())
                Button {
                    viewModel.skipNameChoice()
                } label: {
                    Text(PerioPresentationStrings.Onboarding.secondaryButton)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(SecondaryButton())
            }
            .padding(.horizontal, horizontalSpacing)
        }
        .background {
            PerioDesignSystemAsset.Foundation.background.swiftUIColor.ignoresSafeArea()
        }
    }

    public init(viewModel: OnboardingViewModel) {
        self.viewModel = viewModel
    }
}

#Preview {
    OnboardingView(viewModel: StubOnboardingViewModel())
}
