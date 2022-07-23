//
//  FileService.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

protocol FileServiceProtocol {
    func loadData() -> [MediaCategory]
}

struct FileService: FileServiceProtocol {
    
    // MARK: - Private Properties
    
    private let decoder = JSONDecoder()
    private var filename = "database.json"
    
    private var applicationSupportDirectory: URL {
        FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
    }
    
    private var databaseFileUrl: URL {
        applicationSupportDirectory.appendingPathComponent(filename)
    }
    
    // MARK: - Public Methods
    
    func loadData() -> [MediaCategory] {
        guard let file = Bundle.main.url(forResource: "movies", withExtension: "json"),
              let data = try? Data(contentsOf: file),
              let medias = try? decoder.decode([MediaCategory].self, from: data) else {
            
            return []
        }
        
        return medias
    }
}
