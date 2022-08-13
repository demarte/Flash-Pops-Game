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
    let isSelected: Bool
    @State private var onHover: Bool = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if media.status == .notAnswerd {
                posterView
            } else {
                cardBackgroundView
            }
            CardOnHoverView(onHover: $onHover)
        }
        .frame(width: 180)
        .aspectRatio(3/4, contentMode: .fit)
        .cornerRadius(8)
        .onHover(perform: hanldeHover)
        .padding()
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
                    .scaledToFill()
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
            Color.accentColor
        }
    }
    
    // MARK: - Private Methods
    
    private func hanldeHover(_ inside: Bool) {
        onHover = inside
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(media: Media.sample,
                 isSelected: true)
            .frame(width: 180, height: 240)
            .preferredColorScheme(.light)
    }
}
#endif
