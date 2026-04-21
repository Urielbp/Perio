import PerioPresentation
import SwiftUI

public struct ContentView: View {
    public init() {}

    public var body: some View {
        SettingsCoordinator.makeSettingsView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
