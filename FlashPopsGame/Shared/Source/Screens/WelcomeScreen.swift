//
//  WelcomeScreen.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black, .blue],
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
            Text("Welcome to Flash Pops")
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
