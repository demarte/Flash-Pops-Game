//
//  Toolbar.swift
//  FlashPopsGame (macOS)
//
//  Created by Ivan De Martino on 9/3/22.
//

import SwiftUI

struct Toolbar: ToolbarContent {
    
    @Binding var selectedLevel: Level?
    var nextLevelMessage: String
    
    var body: some ToolbarContent {
        ToolbarItem(placement: .navigation) {
            Button {
                toggleSidebar()
            } label: {
                Image(systemName: "sidebar.left")
            }
            .help("Toggle Toolbar")
        }
        ToolbarItem(placement: .primaryAction) {
            levelProgress
        }
    }
    
    private var levelProgress: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 6)
                    .foregroundColor(.accentColor)
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text(selectedLevel?.progress ?? .init())
                }
                .foregroundColor(.white)
            }
            .frame(width: 60, height: 24)
            Text("\(nextLevelMessage)")
                .padding(.trailing)
        }
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?
            .contentViewController?
            .tryToPerform(#selector(NSSplitViewController.toggleSidebar),
                          with: nil)
    }
}
