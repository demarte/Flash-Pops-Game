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
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            if media.status == .notAnswerd {
                posterView
            } else {
                cardBackgroundView
            }
            cardBorder
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
        Color.accentColor
    }
    
    private var cardBorder: some View {
        ZStack {
            if isSelected {
                RoundedRectangle(cornerRadius: 8)
                    .strokeBorder(lineWidth: 4)
                    .foregroundColor(.black)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func hanldeHover(_ inside: Bool) {
        if inside {
            NSCursor.pointingHand.push()
        } else {
            NSCursor.pop()
        }
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(media: Media.sample,
                 isSelected: true)
            .preferredColorScheme(.light)
    }
}
#endif
