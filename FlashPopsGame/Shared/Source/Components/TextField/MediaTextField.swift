//
//  MediaTextField.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/27/22.
//

import SwiftUI

struct MediaTextField: View {
    
    var media: Media
    let onChange: ((String) -> Void)?
    @State private var iconColor: Color = .accentColor
    
    @State private var inputText: String = .init()
    
    var body: some View {
        HStack {
            if media.status == .success {
                Text(media.title)
            } else {
                TextField(Localizable.guessTheTitle.localized,
                          text: $inputText)
                .textFieldStyle(.roundedBorder)
                .showClearButton($inputText, color: $iconColor)
                .frame(height: 30)
                .onChange(of: inputText, perform: { text in
                    print(media.status)
                    onChange?(text)
                    iconColor =  media.status == .success ? .accentColor : .red
                })
            }
        }
    }
}

#if DEBUG
struct MediaTextField_Previews: PreviewProvider {
    static var previews: some View {
        MediaTextField(media: .sample, onChange: nil)
            .frame(width: 200)
            .showClearButton(.constant("hello"),
                             color: .constant(.accentColor))
    }
}
#endif
