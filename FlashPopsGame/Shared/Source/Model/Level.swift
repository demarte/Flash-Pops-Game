//
//  Level.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

struct Level: Codable {
    let number: Int
    var medias: [Media]
    var isLocked: Bool
}

// MARK: - Fixture

extension Level {
    
    static func fixture(number: Int = .zero,
                        medias: [Media] = [Media.fixture()],
                        isLocked: Bool = false) -> Level {
        return Level(number: number, medias: medias, isLocked: isLocked)
    }
}
