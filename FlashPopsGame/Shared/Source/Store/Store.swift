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
    
    // MARK: - Initializer
    
    /// Instantiates an `Store` class
    /// - Parameter fileService: A type that conforms to `FileServiceProtocol`
    public init(fileService: FileServiceProtocol = FileService()) {
        self.fileService = fileService
        finishInit()
    }
    
    // MARK: - Private Methods
    
    private func finishInit() {
        categories = fileService.loadData()
    }
}
