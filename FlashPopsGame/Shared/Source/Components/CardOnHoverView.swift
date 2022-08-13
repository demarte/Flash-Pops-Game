//
//  CardOnHoverView.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/13/22.
//

import SwiftUI

struct CardOnHoverView: View {
    
    @Binding var onHover: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(onHover ? 0.3 : 0)
            PlayButtonView(onHover: $onHover)
                .frame(width: 60, height: 60)
        }
    }
}

struct CardOnHoverView_Previews: PreviewProvider {
    static var previews: some View {
        CardOnHoverView(onHover: .constant(true))
    }
}
