import PerioDomain
import PerioPresentation
import SwiftUI

@main
struct PerioApp: App {
    @State var currentMode: AppearanceMode = .systemSelected

    init() {
        AppDI.registerAll()
    }

    private func setupAppearanceModeUse() async {
        let useCase = DIRegistry.shared.resolve(GetAppearanceModeUseCase.self)
        for await mode in useCase.invoke() {
            currentMode = mode
        }
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(currentMode.colorScheme)
                .task {
                    await setupAppearanceModeUse()
                }
        }
    }
}
