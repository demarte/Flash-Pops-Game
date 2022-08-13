//
//  CacheAsyncImage.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/6/22.
//

import SwiftUI

struct CacheAsyncImage<Content>: View where Content: View {
    
    // MARK: - Private Properties
    
    private let url: URL
    private let scale: CGFloat
    private let transaction: Transaction
    private let content: (AsyncImagePhase) -> Content
    
    // MARK: - Initializer
    
    init(url: URL,
         scale: CGFloat = 1.0,
         transaction: Transaction = Transaction(),
         @ViewBuilder content: @escaping (AsyncImagePhase) -> Content) {
        self.url = url
        self.scale = scale
        self.transaction = transaction
        self.content = content
    }
    
    // MARK: - Body
    
    var body: some View {
        if let cached = ImageCache[url] {
            content(.success(cached))
        } else {
            AsyncImage(url: url,
                       scale: scale,
                       transaction: transaction) { phase in
                cacheAndRender(phase: phase)
            }
        }
    }
    
    // MARK: - Private Methods
    
    private func cacheAndRender(phase: AsyncImagePhase) -> some View {
        if case .success(let image) = phase {
            ImageCache[url] = image
        }
        return content(phase)
    }
}

fileprivate class ImageCache {
    
    static private var cache: [URL: Image] = [:]
    
    static subscript(url: URL) -> Image? {
        get {
            ImageCache.cache[url]
        }
        set {
            ImageCache.cache[url] = newValue
        }
    }
}
