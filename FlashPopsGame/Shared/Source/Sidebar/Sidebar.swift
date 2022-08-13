//
//  Sidebar.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 7/23/22.
//

import SwiftUI

struct Sidebar: View {

    // MARK: - Properties
    
    let categories: [MediaCategory]
    @Binding var selection: Level.ID?
    
    // MARK: - Body
    
    var body: some View {
        List(selection: $selection) {
            ForEach(categories) { category in
                Section(header: header(category)) {
                    levelsList(category.levels, score: category.score)
                }
            }
        }
        .listStyle(.sidebar)
    }
    
    // MARK: - Private Methods
    
    private func header(_ category: MediaCategory) -> some View {
        HStack {
            Image(systemName: category.icon)
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

#if DEBUG
struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar(categories: MediaCategory.sample,
                selection: .constant(0))
            .preferredColorScheme(.light)
            .frame(width: 200)
    }
}
#endif
