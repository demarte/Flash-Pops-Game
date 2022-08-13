//
//  Level.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

struct Level: Codable, Identifiable {
    let id: Int
    var medias: [Media]
    var isLocked: Bool
}

// MARK: - Fixture

extension Level {
    
    static func fixture(id: Int = .zero,
                        medias: [Media] = [Media.fixture()],
                        isLocked: Bool = false) -> Level {
        return Level(id: id, medias: medias, isLocked: isLocked)
    }
}

// MARK: - Sample

extension Level {
    static var sample: Level {
        let medias: [Media] = [.fixture(id: UUID()),
                               .fixture(id: UUID()),
                               .fixture(id: UUID())
        ]
        return .fixture(medias: medias)
    }
}
