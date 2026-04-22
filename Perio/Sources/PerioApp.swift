import PerioDomain
import PerioPresentation
import SwiftUI

@main
struct PerioApp: App {
    let appearanceState: AppAppearanceState

    init() {
        AppDI.registerAll()
        let useCase = DIRegistry.shared.resolve(GetAppearanceModeUseCase.self)
        appearanceState = AppAppearanceState(getAppearanceUseCase: useCase)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(appearanceState.currentMode.colorScheme)
        }
    }
}
