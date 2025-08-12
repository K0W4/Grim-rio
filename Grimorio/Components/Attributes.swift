//
//  Attributes.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct Attributes: View {
    let character: Character
    
    var body: some View {
        ZStack {
            Image("attributes")
                .resizable()
                .scaledToFit()

            GeometryReader { geometry in
                Text("\(character.agility)")
                    .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.15)

                Text("\(character.strength)")
                    .position(x: geometry.size.width * 0.18, y: geometry.size.height * 0.37)

                Text("\(character.intellect)")
                    .position(x: geometry.size.width * 0.82, y: geometry.size.height * 0.37)

                Text("\(character.presence)")
                    .position(x: geometry.size.width * 0.28, y: geometry.size.height * 0.75)

                Text("\(character.vigor)")
                    .position(x: geometry.size.width * 0.72, y: geometry.size.height * 0.75)
            }
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
        }
    }
}
