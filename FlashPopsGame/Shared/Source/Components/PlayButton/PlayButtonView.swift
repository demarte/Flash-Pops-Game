//
//  PlayButtonView.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/13/22.
//

import SwiftUI

struct PlayButtonView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(0.5))
                .padding(5)
            Image(systemName: "play.fill")
                .font(.system(size: 24))
                .foregroundColor(.white)
                .padding()
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView()
            .frame(width: 60, height: 60)
    }
}
