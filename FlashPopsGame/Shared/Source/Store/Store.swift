//
//  Store.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

final class Store: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published var categories: [MediaCategory] = []
    
    var score: Int {
        categories.reduce(0, { total, category in
            category.score + total
        })
    }
    
    var nextLevelMessage: String {
        if let level = nextLevelAvailableToUnlock {
            return "\(remainingPointsToNextLevel) \(Localizable.levelMessage.localized) \(level.id)"
        }
        return Localizable.feedbackMessage.localized
    }
    
    // MARK: - Private Properties
    
    private let fileService: FileServiceProtocol
    private var levels: [Level] = []
    
    private var nextLevelAvailableToUnlock: Level? {
        for category in categories {
            if let index = category.nextLockedLevelIndex {
                return category.levels[index]
            }
        }
        return nil
    }
    
    private var remainingPointsToNextLevel: Int {
        for points in pointsToUnlockNextLevel {
            if score < points {
                return points - score
            }
        }
        return .zero
    }
    
    // MARK: - Initializer
    
    /// Instantiates an `Store` class
    /// - Parameter fileService: A type that conforms to `FileServiceProtocol`
    init(fileService: FileServiceProtocol = FileService()) {
        self.fileService = fileService
        loadData()
    }
    
    // MARK: - Public Methods
    
    func newGame() {
        loadData(newGame: true)
    }
    
    // MARK: - Private Methods
    
    private func loadData(newGame: Bool = false) {
        let data = fileService.loadData(newGame: newGame)
        levels = data.flatMap { $0.levels }
        categories = data
    }
    
    private func updateCategories(with level: Level) {
        for index in categories.indices {
            if let levelIndex = categories[index].levels.firstIndex(where: { $0.id == level.id }) {
                categories[index].levels[levelIndex] = level
                categories[index].increaseScore()
                fileService.saveGame(with: categories)
                break
            }
        }
    }
}

// MARK: - Subscript

extension Store {
    subscript(levelID: Level.ID?) -> Level? {
        get {
            return levels.first(where: { $0.id == levelID })
        }
        set(newValue) {
            if let id = levelID,
               let index = levels.firstIndex(where: { $0.id == id }),
               let level = newValue {
                levels[index] = level
                updateCategories(with: level)
            }
        }
    }
}
