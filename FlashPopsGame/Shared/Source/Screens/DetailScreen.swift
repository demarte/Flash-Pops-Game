//
//  WelcomeScreen.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct DetailScreen: View {
    
    // MARK: Public Properties
    
    @Binding var selectedLevel: Level
    
    // MARK: Private Properties
    
    @State private var selectedMedia: Media?
    
    private var columns: [GridItem] {
        [.init(.adaptive(minimum: 160, maximum: 160))]
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            levelProgress
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(selectedLevel.medias) { media in
                        CardView(media: media,
                                 isSelected: selectedMedia == media,
                                 onChange: onChange)
                            .onTapGesture {
                                selectedMedia = media
                            }
                            .frame(width: 160)
                    }
                }
            }
        }
        AudioPlayerView(media: $selectedMedia)
    }
    
    // MARK: - Private Properties
    
    private var levelProgress: some View {
        VStack {
            Label(selectedLevel.progress, systemImage: "checkmark.circle")
            .frame(width: 58, height: 28)
        }
        .cornerRadius(4)
        .background(Color.accentColor)
        .padding()
    }
    
    // MARK: - Private Properties
    
    private func onChange(_ media: Media) {
        guard let index = selectedLevel.medias.firstIndex(where: { $0.id == media.id }) else { return }
        
        selectedLevel.medias[index].status = .success
    }
}

#if DEBUG
struct DetailScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailScreen(selectedLevel: .constant(Level.sample))
            .frame(width: 600)
    }
}
#endif
