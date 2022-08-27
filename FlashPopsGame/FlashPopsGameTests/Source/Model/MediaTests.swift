//
//  MediaTests.swift
//  FlashPopsGameTests
//
//  Created by Ivan De Martino on 8/27/22.
//

import XCTest
@testable import FlashPopsGame

final class MediaTests: XCTestCase {
    
    // MARK: - Tests
    
    func test_compareMedia() {
        var sut = Media.fixture(title: "Batman", status: .notAnswerd)
        
        XCTAssert(sut.compare("batman"))
        
        sut = Media.fixture(title: "Batman", status: .almost)
        
        XCTAssert(sut.compare("batman"))
        XCTAssertFalse(sut.compare("batman2"))
        
        sut = Media.fixture(title: "Batman", status: .success)
        XCTAssertFalse(sut.compare("batman"))
    }
    
    func test_compareMediasWithSameTitles() {
        let firstMedia = Media.fixture(title: "Batman", status: .almost)
        let secondMedia = Media.fixture(title: "Batman", status: .notAnswerd)
        
        XCTAssertEqual(firstMedia, secondMedia)
    }
    
    func test_compareMediasWithDifferentTitles() {
        let firstMedia = Media.fixture(title: "Batman", status: .almost)
        let secondMedia = Media.fixture(title: "Titanic", status: .notAnswerd)
        
        XCTAssertNotEqual(firstMedia, secondMedia)
    }
}
