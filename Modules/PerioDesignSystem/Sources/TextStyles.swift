//
//  TextStyles.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 20/04/26.
//

import SwiftUI

// MARK: - Title modifier

struct Title: ViewModifier {
    private let fontSize: CGFloat = 34
    private let letterSpacing: CGFloat = -1

    func body(content: Content) -> some View {
        content
            .font(PerioDesignSystemFontFamily.Fraunces.italic.swiftUIFont(size: fontSize))
            .foregroundStyle(PerioDesignSystemAsset.Text.ink.swiftUIColor)
            .kerning(letterSpacing)
    }
}

// MARK: - Sheet modifier

struct SheetTitle: ViewModifier {
    private let fontSize: CGFloat = 18
    private let letterSpacing: CGFloat = -0.3

    func body(content: Content) -> some View {
        content
            .font(PerioDesignSystemFontFamily.Fraunces.italic.swiftUIFont(size: fontSize))
            .foregroundStyle(PerioDesignSystemAsset.Text.ink.swiftUIColor)
            .kerning(letterSpacing)
    }
}

// MARK: - Section modifier

struct SectionLabel: ViewModifier {
    private let fontSize: CGFloat = 11.5
    private let letterSpacing: CGFloat = 1.2

    func body(content: Content) -> some View {
        content
            .font(PerioDesignSystemFontFamily.Manrope.bold.swiftUIFont(size: fontSize))
            .foregroundStyle(PerioDesignSystemAsset.Text.inkMuted.swiftUIColor)
            .kerning(letterSpacing)
    }
}

// MARK: - List item modifier

struct ListItemStyle: ViewModifier {
    private let fontSize: CGFloat = 16
    private let letterSpacing: CGFloat = -0.2

    func body(content: Content) -> some View {
        content
            .font(PerioDesignSystemFontFamily.Manrope.semiBold.swiftUIFont(size: fontSize))
            .foregroundStyle(PerioDesignSystemAsset.Text.ink.swiftUIColor)
            .kerning(letterSpacing)
    }
}

// MARK: - BodyDescription modifier

struct BodyDescription: ViewModifier {
    private let fontSize: CGFloat = 14.5
    private let letterSpacing: CGFloat = -0.2

    func body(content: Content) -> some View {
        content
            .font(PerioDesignSystemFontFamily.Manrope.medium.swiftUIFont(size: fontSize))
            .foregroundStyle(PerioDesignSystemAsset.Text.inkMid.swiftUIColor)
    }
}

// MARK: - Caption modifier

struct CaptionDescription: ViewModifier {
    private let fontSize: CGFloat = 12

    func body(content: Content) -> some View {
        content
            .font(PerioDesignSystemFontFamily.Manrope.medium.swiftUIFont(size: fontSize))
            .foregroundStyle(PerioDesignSystemAsset.Text.inkMuted.swiftUIColor)
    }
}

// MARK: - Sheet extension

extension Text {
    public func titleStyle() -> some View {
        modifier(Title())
    }
}

// MARK: - Title extension

extension TextField {
    public func titleStyle() -> some View {
        modifier(Title())
    }
}

// MARK: - Sheet extension

extension Text {
    public func sheetTitleStyle() -> some View {
        modifier(SheetTitle())
    }
}

// MARK: - Section extension

extension Text {
    public func sectionLabelStyle() -> some View {
        modifier(SectionLabel())
    }
}

// MARK: - List item extension

extension Text {
    public func listItemStyle() -> some View {
        modifier(ListItemStyle())
    }
}

// MARK: - BodyDescription extension

extension Text {
    public func bodyDescriptionStyle() -> some View {
        modifier(BodyDescription())
    }
}

// MARK: - Caption extension

extension Text {
    public func captionStyle() -> some View {
        modifier(CaptionDescription())
    }
}

// MARK: - Preview

#Preview {
    VStack {
        Text("Title")
            .titleStyle()
        Text("SECTION LABEL")
            .sectionLabelStyle()
        Text("List item title")
            .listItemStyle()
        Text("Body / description")
            .bodyDescriptionStyle()
        Text("Caption / Metadata")
            .captionStyle()
    }
}
