//
//  Menus.swift
//  FlashPopsGame (macOS)
//
//  Created by Ivan De Martino on 9/3/22.
//

import SwiftUI

struct Menus: Commands {
    
    @AppStorage("displayMode") var displayMode: DisplayMode = .auto
    
    var body: some Commands {
        SidebarCommands()
        ToolbarCommands()
        CommandGroup(replacing: .newItem) {
            Button("New Game") {
                
            }
            .keyboardShortcut("n", modifiers: [.command])
        }
        CommandMenu("Display") {
            Picker("Appearance", selection: $displayMode) {
                ForEach(DisplayMode.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
        }
    }
}
