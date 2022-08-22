//
//  Localizable.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/22/22.
//

import Foundation

enum Localizable: String {
    
    case scoreText
    case levelText
    case guessTheTitle
    case levelMessage
    case feedbackMessage
    
    var localized: String {
        NSLocalizedString(rawValue, comment: .init())
    }
}
