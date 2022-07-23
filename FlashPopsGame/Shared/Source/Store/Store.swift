//
//  Store.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

final class Store: ObservableObject {
    
    // MARK: - Public Properties
    
    @Published public var categories: [MediaCategory] = []
    
    // MARK: - Private Properties
    
    private let fileService: FileServiceProtocol
    private var levels: [Level] = []
    
    // MARK: - Initializer
    
    /// Instantiates an `Store` class
    /// - Parameter fileService: A type that conforms to `FileServiceProtocol`
    public init(fileService: FileServiceProtocol = FileService()) {
        self.fileService = fileService
        finishInit()
    }
    
    // MARK: - Private Methods
    
    private func finishInit() {
        let data = fileService.loadData()
        levels = data.flatMap { $0.levels }
        categories = data
    }
}

// MARK: - Subscript

extension Store {
    subscript(levelID: Level.ID?) -> Level {
        get {
            if let id = levelID {
                return levels.first(where: { $0.id == id }) ?? .fixture()
            }
            return .fixture()
        }
        set(newValue) {
            if let id = levelID,
               let index = levels.firstIndex(where: { $0.id == id }) {
                levels[index] = newValue
            }
        }
    }
}
