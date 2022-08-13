//
//  FileService.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

protocol FileServiceProtocol {
    func loadData() -> [MediaCategory]
    func saveGame(with mediaCategories: [MediaCategory])
}

struct FileService: FileServiceProtocol {
    
    // MARK: - Private Properties
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let filename = "movies"
    
    // MARK: - Public Methods
    
    func loadData() -> [MediaCategory] {
        guard let data = UserDefaults.standard.object(forKey: UserDefaultsKey.flashPopsGameData.rawValue) as? Data,
           let medias = try? decoder.decode([MediaCategory].self, from: data) else {
          return loadFromJSON()
        }
        
        return medias
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
}
