//
//  Protections.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct Protections: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Proteção:")
                    .foregroundStyle(.labelSecondary)
                
                Text("\(character.protection)")
            }
            
            HStack {
                Text("Resistências:")
                    .foregroundStyle(.labelSecondary)
                
                Text("\(character.resistence)")
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(
            Image(.corner)
                .resizable()
        )
    }
}
