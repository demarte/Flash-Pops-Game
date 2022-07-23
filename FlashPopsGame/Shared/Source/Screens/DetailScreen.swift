//
//  WelcomeScreen.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct DetailScreen: View {
    
    @Binding var selectedLevel: Level
    
    var body: some View {
        ZStack {
            Color.clear
            Text("Welcome to Flash Pops, level: \(selectedLevel.id)")
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen(selectedLevel: .constant(.fixture()))
    }
}
