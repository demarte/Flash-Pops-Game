//
//  ContentView.swift
//  Shared
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    @SceneStorage("selection") private var selectedLevelID: Level.ID?
    
    var body: some View {
        NavigationView {
            Sidebar(categories: store.categories,
                    selection: selection)
            DetailScreen(selectedLevel: selectedLevel)
        }
    }
    
    private var selection: Binding<Level.ID?> {
        Binding(get: { selectedLevelID }, set: { selectedLevelID = $0 })
    }
    
    private var selectedLevel: Binding<Level> {
        $store[selection.wrappedValue]
    }
}
