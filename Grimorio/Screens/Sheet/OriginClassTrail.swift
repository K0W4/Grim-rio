//
//  OriginClassTrail.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct OriginClassTrail: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Origem:")
                    .foregroundStyle(.labelSecondary)
                
                Text("\(character.origin.rawValue)")
            }
            
            HStack {
                Text("Classe:")
                    .foregroundStyle(.labelSecondary)
                
                Text("\(character.clas.rawValue)")
            }
            
            HStack {
                Text("Trilha:")
                    .foregroundStyle(.labelSecondary)
                
                Text("\(character.trail.rawValue)")
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
