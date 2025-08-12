//
//  Defense.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct Defense: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Image(systemName: "shield.fill")
                    .resizable()
                    .frame(width: 53, height: 65)
                    .foregroundColor(.labelPrimary)
                    
                Text("\(10 + character.agility)")
                    .font(.system(.largeTitle, weight: .semibold))
                    .foregroundStyle(.backgroundPrimary)
            }
                
            VStack(alignment: .leading) {
                Text("Defesa")
                    .font(.system(.title3, weight: .semibold))
                    .foregroundStyle(.labelSecondary)
                    
                Text("= 10 + AGI + Bônus")
                    .font(.footnote)
                    .foregroundStyle(.labelPrimary)
            }
        }
        .frame(width: 200, height: 98)
        .padding(.horizontal, 8)
        .background(
            Image(.corner)
                .resizable()
        )
    }
}
