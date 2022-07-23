//
//  Networker.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

enum FetchError: Error {
    case badURL
}

enum Networker {
    static func fetchMusic(with songURL: URL) async throws -> Data {        
        let request = URLRequest(url: songURL)
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    }
}
