//
//  SwiftUIView.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 07/08/25.
//

import SwiftUI

struct ButtonApp: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.button)
            .foregroundStyle(.accent)
            .padding(.horizontal, 16)
            .background(
                Image(.botao)
                    .resizable()
                    .scaledToFill()
            )
    }
}

#Preview {
    ButtonApp(text: "")
}
