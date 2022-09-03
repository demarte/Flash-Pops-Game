//
//  TextFieldClearButton.swift
//  FlashPopsGame
//
//  Created by Ivan De Martino on 8/29/22.
//

import SwiftUI

struct TextFieldClearButton: ViewModifier {
    
    @Binding var inputText: String
    @Binding var color: Color
    
    func body(content: Content) -> some View {
        content
            .overlay {
                if !inputText.isEmpty {
                    HStack {
                        Spacer()
                        Button {
                            inputText = .init()
                        } label: {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(color)
                        }
                        .buttonStyle(.borderless)
                        .padding(.horizontal, 4)
                    }
                }
            }
    }
}

extension View {
    func showClearButton(_ text: Binding<String>, color: Binding<Color>) -> some View {
        modifier(TextFieldClearButton(inputText: text, color: color))
    }
}
