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
    @State private var inputText: String = .init()
    
    private var columns: [GridItem] {
        [.init(.adaptive(minimum: 200, maximum: 200))]
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            TextField("Guess the title", text: $inputText)
                .textFieldStyle(.roundedBorder)
                .frame(width: 300, height: 30)
                .onChange(of: inputText, perform: onChange)
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(selectedLevel.medias) { media in
                        CardView(media: media,
                                 isSelected: selectedMedia == media)
                            .onTapGesture {
                                selectedMedia = media
                            }
                            .frame(width: 180)
                    }
                }
            }
        }
        AudioPlayerView(media: $selectedMedia)
    }
    
    // MARK: - Private Methods
    
    private func onChange(_ text: String) {
        if let index = selectedLevel.medias.firstIndex(where: { $0.id == selectedMedia?.id }),
           text.lowercased() == selectedMedia?.title.lowercased() {
            selectedLevel.medias[index].status = .success
            selectedMedia = nil
        }
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
