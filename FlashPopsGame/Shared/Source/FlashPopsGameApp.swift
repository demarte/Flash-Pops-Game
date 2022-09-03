//
//  FlashPopsGameApp.swift
//  Shared
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

@main
struct FlashPopsGameApp: App {
    
    @StateObject private var store = Store()
    @AppStorage("displayMode") var displayMode: DisplayMode = .auto
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .onAppear {
                    DisplayMode.changeDisplayMode(to: displayMode)
                }
                .onChange(of: displayMode) { newValue in
                    DisplayMode.changeDisplayMode(to: newValue)
                }
        }
        .commands {
            Menus()
        }
    }
}
