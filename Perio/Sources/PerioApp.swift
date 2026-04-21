import PerioPresentation
import SwiftUI

@main
struct PerioApp: App {

    init() {
        registerDIModules()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }

    func registerDIModules() {
        SettingsDI.register()
    }
}
