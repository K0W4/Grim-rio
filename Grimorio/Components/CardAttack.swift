//
//  CardAttack.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 10/08/25.
//

import SwiftUI

struct CardAttack: View {
    var name: String
    var test: String
    var damage: String
    var critical: String
    var image: Image
    
    var body: some View {
        VStack(spacing: -4) {
            Text(name)
                .font(.card)
                .foregroundStyle(.labelPrimary)
            
            HStack() {
                image
                    .resizable()
                    .frame(width: 80, height: 80)
                
                VStack(alignment: .leading, spacing: 12) {
                    HStack() {
                        Text("Teste:")
                            .fontWeight(.semibold)
                            .foregroundStyle(.labelSecondary)
                        Text(test)
                    }
                                    
                    HStack() {
                        Text("Dano:")
                            .fontWeight(.semibold)
                            .foregroundStyle(.labelSecondary)
                        Text(damage)
                    }
                    
                    HStack() {
                        Text("Crítico:")
                            .fontWeight(.semibold)
                            .foregroundStyle(.labelSecondary)
                        Text(critical)
                    }
                }
                .padding(.horizontal, 4)
                .frame(width: 233, alignment: .leading)
            }
        }
        .frame(width: 330, height: 131, alignment: .leading)
        .background(
            Image(.corner)
                .resizable()
                .frame(width: 361, height: 147)
        )
    }
}

#Preview {
    CardAttack(name: "Espada", test: "5d20 + 10", damage: "1d8/1d10", critical: "19x2", image: Image(.default))
}
