//
//  CardView.swift
//  FlashPopsGame (iOS)
//
//  Created by Ivan De Martino on 7/25/22.
//

import SwiftUI

struct CardView: View {
    
    // MARK: - Enum
    
    private enum Constants {
      static let baseUrl = "https://image.tmdb.org/t/p/w500/"
    }
    
    var media: Media
    let onChange: ((Media) -> Void)?
    @State private var onHover: Bool = false
    @State private var inputText: String = .init()
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            ZStack {
                if media.status == .success {
                    posterView
                } else {
                    cardBackgroundView
                }
                CardOnHoverView(onHover: $onHover)
            }
            .frame(width: 144)
            .aspectRatio(3/4, contentMode: .fit)
            .cornerRadius(8)
            .onHover(perform: hanldeHover)
            TextField(Localizable.guessTheTitle.localized,
                      text: $inputText)
                .textFieldStyle(.roundedBorder)
                .frame(height: 30)
                .onChange(of: inputText, perform: onChange)
        }
    }
    
    // MARK: - Private Properties
    
    private var url: URL {
        URL(string: Constants.baseUrl)!
            .appendingPathComponent(media.posterPath)
    }
    
    private var posterView: some View {
        CacheAsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
            case .failure:
                CardErrorView()
            case .empty:
                ProgressView()
            @unknown default:
                EmptyView()
            }
        }
    }
    
    private var cardBackgroundView: some View {
        ZStack {
            Color.cardColor
            Image("CardBackground")
                .resizable()
                .scaledToFit()
        }
    }
    
    // MARK: - Private Methods
    
    private func hanldeHover(_ inside: Bool) {
        onHover = inside
    }
    
    private func onChange(_ text: String) {
        guard media.status == .notAnswerd,
              text.lowercased() == media.title.lowercased() else { return }
            
        onChange?(media)
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(media: Media.sample,
                 onChange: nil)
            .frame(width: 180, height: 240)
            .preferredColorScheme(.light)
    }
}
#endif
