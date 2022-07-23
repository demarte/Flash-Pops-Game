//
//  WelcomeScreen.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct DetailScreen: View {
    
    @Binding var selectedLevel: Level
    @State private var selectedMedia: Media?
    
    let columns = [GridItem(.adaptive(minimum: 80))]
    
    var body: some View {
        ZStack {
            Color.clear
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(selectedLevel.medias) { media in
                        Button {
                            selectedMedia = media
                        } label: {
                            Text("Title: \(media.title)")
                        }
                    }
                }
            }
            AudioPlayerView(media: $selectedMedia)
        }
    }
}

#if DEBUG
struct DetailScreen_Previews: PreviewProvider {
    
    static var levelData: Level {
        .fixture(medias: [.fixture()])
    }
    
    static var previews: some View {
        DetailScreen(selectedLevel: .constant(levelData))
    }
}
#endif
