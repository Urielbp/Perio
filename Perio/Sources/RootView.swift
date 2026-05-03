import PerioPresentation
import SwiftUI

public struct RootView: View {

    // MARK: - Private properties

    private let onboardingCoordinator: OnboardingCoordinator = OnboardingCoordinator()

    // MARK: - Public properties

    public var body: some View {
        if onboardingCoordinator.hasCompletedOnboarding {
            SettingsCoordinator.makeSettingsView()
        } else {
            onboardingCoordinator.makeOnboardingView()
        }
    }

    // MARK: - Init

    public init() {}
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
