//
//  CardErrorView.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/6/22.
//

import SwiftUI

struct CardErrorView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "text.below.photo")
                .font(.largeTitle)
            Spacer()
        }
    }
}

#if DEBUG
struct CardErrorView_Previews: PreviewProvider {
    static var previews: some View {
        CardErrorView()
            .frame(width: 180)
    }
}
#endif
