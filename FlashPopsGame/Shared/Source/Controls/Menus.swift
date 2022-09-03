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
        CommandMenu(Localizable.displayMenu.localized) {
            Picker(Localizable.displayItem.localized, selection: $displayMode) {
                ForEach(DisplayMode.allCases, id: \.self) {
                    Text($0.rawValue)
                        .tag($0)
                }
            }
        }
    }
}
