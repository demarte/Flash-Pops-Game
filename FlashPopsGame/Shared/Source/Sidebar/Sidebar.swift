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
    @EnvironmentObject var store: Store
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            scoreView
            List(selection: $selection) {
                ForEach(categories) { category in
                    Section(header: header(category)) {
                        levelsList(category.levels)
                    }
                }
            }
            .listStyle(.sidebar)
        }
    }
    
    // MARK: - Private Methods
    
    private var scoreView: some View {
        ZStack(alignment: .leading) {
            Color.black.opacity(0.15)
            Text("\(Localizable.scoreText.localized) \(store.score)")
                .padding(.leading)
        }
        .frame(height: 28)
        .cornerRadius(4)
        .padding()
    }
    
    private func header(_ category: MediaCategory) -> some View {
        Label(category.name, systemImage: category.icon)
    }
    
    private func levelsList(_ levels: [Level]) -> some View {
        ForEach(levels) { level in
            HStack {
                Label("\(Localizable.levelText.localized) \(level.id)",
                      systemImage: level.isLocked ? "lock" : "lock.open")
                    .font(.body)
                    .padding(.leading)
                if level.scoreCount == level.medias.count {
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundColor(.green)
                }
            }
        }
        .onChange(of: selection) { [oldSelection = selection] newSelection in
            if let level = levels.first(where: { $0.id == newSelection }),
               level.isLocked {
                selection = oldSelection
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
            .environmentObject(Store())
    }
}
#endif
