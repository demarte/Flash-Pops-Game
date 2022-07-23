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
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
        }
    }
}
