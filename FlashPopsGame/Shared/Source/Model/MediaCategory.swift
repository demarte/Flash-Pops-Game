//
//  MediaCategory.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

struct MediaCategory: Codable, Identifiable {
    
    // MARK: - Properties
    
    let id: Int
    let name: String
    let icon: String
    var levels: [Level]
    var score: Int
    var isLocked: Bool
}

// MARK: - Equatable

extension MediaCategory: Equatable {
    static func == (lhs: MediaCategory, rhs: MediaCategory) -> Bool {
        return lhs.id == rhs.id && lhs.name == rhs.name
    }
}

// MARK: - Fixture

extension MediaCategory {
    
    static func fixture(id: Int = .zero,
                        name: String = .init(),
                        icon: String = .init(),
                        levels: [Level] = [Level.fixture()],
                        score: Int = 10,
                        isLocked: Bool = false) -> MediaCategory {
        return MediaCategory(id: id,
                             name: name,
                             icon: icon,
                             levels: levels,
                             score: score,
                             isLocked: isLocked)
    }
}
