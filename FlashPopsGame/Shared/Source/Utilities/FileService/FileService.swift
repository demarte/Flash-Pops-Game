//
//  FileService.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

protocol FileServiceProtocol {
    func loadData(newGame: Bool) -> [MediaCategory]
    func saveGame(with mediaCategories: [MediaCategory])
}

struct FileService: FileServiceProtocol {
    
    // MARK: - Private Properties
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let filename = "movies"
    
    // MARK: - Public Methods
    
    func loadData(newGame: Bool) -> [MediaCategory] {
        newGame ? loadFromJSON() : loadFromUserDefaults()
    }
    
    func saveGame(with mediaCategories: [MediaCategory]) {
        guard let data = try? encoder.encode(mediaCategories) else { return }
        
        UserDefaults.standard.set(data, forKey: UserDefaultsKey.flashPopsGameData.rawValue)
    }
    
    // MARK: - Private Methods
    
    private func loadFromJSON() -> [MediaCategory] {
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: file),
              let medias = try? decoder.decode([MediaCategory].self, from: data) else {
            
            return []
        }
        
        return medias
    }
    
    private func loadFromUserDefaults() -> [MediaCategory] {
        guard let data = UserDefaults.standard.object(forKey: UserDefaultsKey.flashPopsGameData.rawValue) as? Data,
              let categories = try? decoder.decode([MediaCategory].self, from: data) else {
            return loadFromJSON()
        }
        return addNewCategoriesFromJSON(categories)
    }
    
    private func addNewCategoriesFromJSON(_ categories: [MediaCategory]) -> [MediaCategory] {
        var newCategories = categories
        let jsonData = loadFromJSON()

        for index in jsonData.indices {
            let currentLevelsCount = categories[index].levels.count
            let jsonLevelsCount = jsonData[index].levels.count
            if currentLevelsCount != jsonLevelsCount {
                let diffLength = jsonLevelsCount - currentLevelsCount
                let newLevels = jsonData[index].levels.suffix(diffLength)
                newCategories[index].levels.append(contentsOf: newLevels)
            }
        }
        return newCategories
    }
}
