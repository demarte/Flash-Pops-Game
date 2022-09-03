//
//  MediaCategory.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

// MARK: - Constants

let pointsToUnlockNextLevel = [15, 45, 75, 110]

struct MediaCategory: Codable, Identifiable {
    
    // MARK: - Properties
    
    let id: Int
    let name: String
    let icon: String
    var levels: [Level]
    var score: Int
    var isLocked: Bool
    
    var nextLockedLevelIndex: Int? {
        levels.firstIndex(where: { $0.isLocked })
    }
    
    mutating func increaseScore() {
        score += 1
        if pointsToUnlockNextLevel.contains(score),
           let index = nextLockedLevelIndex {
            levels[index].isLocked = false
        }
    }
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

// MARK: - Sample

extension MediaCategory {
    static var sample: [MediaCategory] {
        [
            .fixture(id: 0,
                     name: "Movies",
                     icon: "film",
                     score: 10,
                     isLocked: false),
            .fixture(id: 5,
                     name: "TV Shows",
                     icon: "tv",
                     score: 2,
                     isLocked: false)
        ]
    }
}
