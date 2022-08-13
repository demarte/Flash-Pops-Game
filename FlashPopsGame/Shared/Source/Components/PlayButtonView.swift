//
//  PlayButtonView.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/13/22.
//

import SwiftUI

struct PlayButtonView: View {
    
    @Binding var onHover: Bool
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black.opacity(onHover ? 0.5 : 0.1))
                .padding(5)
            Image(systemName: "play.fill")
                .font(.system(size: 24))
                .foregroundColor(.white.opacity(onHover ? 1 : 0.5))
                .padding()
        }
    }
}

struct PlayButton_Previews: PreviewProvider {
    static var previews: some View {
        PlayButtonView(onHover: .constant(false))
            .frame(width: 60, height: 60)
    }
}
