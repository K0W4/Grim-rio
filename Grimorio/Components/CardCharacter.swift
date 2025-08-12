//
//  CardCharacter.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 07/08/25.
//

import SwiftUI

struct CardCharacter: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(.card)
            .foregroundStyle(.labelPrimary)
            .padding(.horizontal, 16)
            .background(
                Image(.corner)
                    .resizable()
                    .frame(width: 361, height: 96)
            )
    }
}

#Preview {
    CardCharacter(name: "Gebbedaya")
}
