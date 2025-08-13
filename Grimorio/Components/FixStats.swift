//
//  FixStats.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct FixStats: View {
    let character: Character
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("NEX:")
                    .foregroundStyle(.labelSecondary)
                
                Text("\(character.nex.rawValue)")
            }
            
            HStack {
                Text("PE/Turno:")
                    .foregroundStyle(.labelSecondary)
                
                Text("10")
            }
            
            HStack {
                Text("Desl.:")
                    .foregroundStyle(.labelSecondary)
                
                Text("9m/6q")
            }
        }
        .frame(width: 137, height: 98)
        .background(
            Image(.corner)
                .resizable()
        )
    }
}
