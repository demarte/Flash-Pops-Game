//
//  AudioPlayerView.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI
import AVKit

struct AudioPlayerView: View {
    
    // MARK: - Public Properties
    
    @Binding var media: Media?
    
    // MARK: - Private Properties
    
    @State private var audioPlayer: AVAudioPlayer?
    
    // MARK: - Body
    
    var body: some View {
        EmptyView()
        .onChange(of: media) { newValue in
            if let value = newValue {
                audioPlayer?.stop()
                audioPlayer = nil
                Task {
                    await fetch(mediaURL: value.songUrl)
                }
            }
        }
    }
    
    private func play() {
        audioPlayer?.pause()
        audioPlayer?.currentTime = .zero
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
    @MainActor private func fetch(mediaURL: URL) async {
        do {
            let data = try await Networker.fetchMusic(with: mediaURL)
            audioPlayer = try AVAudioPlayer(data: data)
            play()
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}

#if DEBUG
struct AudioPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView(media: .constant(nil))
    }
}
#endif
