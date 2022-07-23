//
//  ContentView.swift
//  Shared
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    var body: some View {
        NavigationView {
            Sidebar(categories: store.categories)
            WelcomeScreen()
        }
    }
}
