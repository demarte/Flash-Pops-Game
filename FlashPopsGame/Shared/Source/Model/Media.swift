//
//  Media.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import Foundation

struct Media: Codable, Identifiable {
    let id: UUID
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
            self.status = MediaStatus(rawValue: .zero) ?? .notAnswerd
        }
        id = UUID()
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
    static func fixture(id: UUID = UUID(),
                        songUrl: URL = Media.sampleURL,
                        title: String = "Flashdance",
                        posterPath: String = "/ziiy6ORt8BlxWFXskBChBMInvDA.jpg",
                        status: MediaStatus = .success) -> Media {
        Media(id: id, songUrl: songUrl, title: title, posterPath: posterPath, status: status)
    }
}

// MARK: - Sample

extension Media {
    static let sample: Media = .fixture(posterPath: "/aCw8ONfyz3AhngVQa1E2Ss4KSUQ.jpg",
                                        status: .success)
    
    static var sampleURL: URL {
        let stringURL = "https://audio-ssl.itunes.apple.com/itunes-assets/Music/v4/29/6c/73/296c7359-20a2-daa4-b726-8ba2f3b49af3/mzaf_745247285689875746.plus.aac.p.m4a"
        return URL(string: stringURL)!
    }
}
