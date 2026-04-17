// Project.swift
import ProjectDescription

// MARK: - SwiftLint

let swiftLintScript: TargetScript = .pre(
    script: """
    if [[ "$(uname -m)" == arm64 ]]
    then
        export PATH="/opt/homebrew/bin:$PATH"
    fi
    if command -v swiftlint >/dev/null 2>&1; then
        swiftlint
    else
        echo "warning: SwiftLint not installed"
    fi
    """,
    name: "SwiftLint",
    basedOnDependencyAnalysis: false
)

// MARK: - Helper

func makeModule(
    name: String,
    dependencies: [TargetDependency] = [],
    hasTests: Bool = true
) -> [Target] {
    var targets: [Target] = [
        .target(
            name: name,
            destinations: .iOS,
            product: .framework,
            bundleId: "com.arousal.bribe.perio.\(name.lowercased())",
            deploymentTargets: .iOS("16.0"),
            sources: ["Modules/\(name)/Sources/**"],
            resources: ["Modules/\(name)/Resources/**"],
            dependencies: dependencies
        )
    ]
    
    if hasTests {
        targets.append(
            .target(
                name: "\(name)Tests",
                destinations: .iOS,
                product: .unitTests,
                bundleId: "com.perio.\(name.lowercased()).tests",
                sources: ["Modules/\(name)/Tests/**"],
                dependencies: [.target(name: name)]
            )
        )
    }
    
    return targets
}

// MARK: - Modules

let moduleTargets: [Target] = [
    makeModule(
        name: "PerioDomain",
        hasTests: false
    ),
    makeModule(
        name: "PerioData",
        dependencies: [
            .target(name: "PerioDomain")
        ],
        hasTests: false),
    makeModule(
        name: "PerioPresentation",
        dependencies: [
            .target(name: "PerioDomain"),
            .target(name: "PerioDesignSystem")
        ],
        hasTests: false),
    makeModule(
        name: "PerioDesignSystem",
        hasTests: false)
].flatMap { $0 }

// MARK: - App Target

let appTarget: Target = .target(
    name: "Perio",
    destinations: .iOS,
    product: .app,
    bundleId: "com.arousal.bribe.perio",
    deploymentTargets: .iOS("16.0"),
    infoPlist: .extendingDefault(with: [
        "CFBundleDisplayName": "Perio",
        "UILaunchScreen": [:],
        "UIAppFonts":[
            "Manrope-VariableFont_wght.ttf",
            "SpaceGrotesk-VariableFont_wght.ttf"
        ]
    ]),
    sources: ["Perio/Sources/**"],
    resources: ["Perio/Resources/**"],
    scripts: [swiftLintScript],
    dependencies: [
        .target(name: "PerioDomain"),
        .target(name: "PerioData"),
        .target(name: "PerioPresentation"),
        .target(name: "PerioDesignSystem")
    ]
)

// MARK: - Test Target

let testTarget: Target = .target(
    name: "PerioTests",
    destinations: .iOS,
    product: .unitTests,
    bundleId: "com.arousal.bribe.perioTests",
    deploymentTargets: .iOS("16.0"),
    infoPlist: .default,
    sources: ["Perio/Tests/**"],
    resources: [],
    dependencies: [
        .target(name: "Perio")
    ]
)

// MARK: - Project

let project = Project(
    name: "Perio",
    targets: moduleTargets + [appTarget] + [testTarget]
)
