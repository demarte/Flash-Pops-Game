//
//  Media.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

struct Media: Codable, Identifiable {
    let id = UUID().uuidString
    let songUrl: URL
    let title: String
    let posterPath: String
    var status: MediaStatus
    
    enum CodingKeys: String, CodingKey {
        case songUrl, title, posterPath, status
    }
}

enum MediaStatus: Int, Codable {
    case notAnswerd = 0
    case almost
    case success
}

extension Media {
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let status = try? values.decode(MediaStatus.self, forKey: .status) {
            self.status = status
        } else {
            self.status = MediaStatus(rawValue: .zero)!
        }
        songUrl = try values.decode(URL.self, forKey: .songUrl)
        title = try values.decode(String.self, forKey: .title)
        posterPath = try values.decode(String.self, forKey: .posterPath)
    }
}

extension Media: Equatable {
    static func == (lhs: Media, rhs: Media) -> Bool {
        return lhs.title == rhs.title
    }
}

// MARK: - Fixture

extension Media {
    static func fixture(songUrl: URL = URL.urlMock,
                        title: String = "Flashdance",
                        posterPath: String = "/ziiy6ORt8BlxWFXskBChBMInvDA.jpg",
                        status: MediaStatus = .success) -> Media {
        return Media(songUrl: songUrl, title: title, posterPath: posterPath, status: status)
    }
}

extension URL {
    static var urlMock: URL {
        let stringURL = "https://audio-ssl.itunes.apple.com/itunes-assets/Music/6d/b0/b6/mzm.grpsgigo.aac.p.m4a"
        return URL(string: stringURL)!
    }
}
