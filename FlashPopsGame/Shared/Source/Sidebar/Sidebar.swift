//
//  Sidebar.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct Sidebar: View {

    let categories: [MediaCategory]
    
    var body: some View {
        List {
            ForEach(categories) { category in
                Section(header: header(category)) {
                    levelsList(category.levels, score: category.score)
                }
            }
        }
    }
    
    private func header(_ category: MediaCategory) -> some View {
        HStack {
            Image(systemName: category.icon)
                .foregroundColor(.pink)
            Text(category.name)
        }
    }
    
    private func levelsList(_ levels: [Level],
                            score: Int) -> some View {
        ForEach(levels) { level in
            HStack {
                Text("Level: \(level.id)")
                    .font(.body)
                if score == 10 {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                }
            }
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    
    static let categories: [MediaCategory] = [
        .fixture(id: 0,
                 name: "Movies",
                 icon: "film",
                 score: 10,
                 isLocked: false),
        .fixture(id: 1,
                 name: "TV Shows",
                 icon: "tv",
                 score: 2,
                 isLocked: false)
    ]
    
    static var previews: some View {
        Sidebar(categories: categories)
            .preferredColorScheme(.light)
    }
}
