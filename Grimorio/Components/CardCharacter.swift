//
//  CardCharacter.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 11/08/25.
//

import SwiftUI
import SwiftData

struct CardCharacter: View {
    let character: Character
    
    var body: some View {
        HStack(spacing: 8) {
            Group {
                if let imageData = character.image, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                } else {
                    
                    Image("default")
                        .resizable()
                }
            }
            .frame(width: 98, height: 98)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(character.name)
                    .font(.card)
                    .foregroundStyle(.labelPrimary)
                
                Text("\(character.clas.rawValue)")
                    .foregroundStyle(.labelSecondary)
            }
            
            Spacer()
            
            ZStack {
                Image("attributes")
                    .resizable()
                    .scaledToFit()
                           
                GeometryReader { geometry in
                    Text("\(character.agility)")
                        .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.15)

                    Text("\(character.strength)")
                        .position(x: geometry.size.width * 0.19, y: geometry.size.height * 0.35)

                    Text("\(character.intellect)")
                        .position(x: geometry.size.width * 0.82, y: geometry.size.height * 0.35)

                    Text("\(character.presence)")
                        .position(x: geometry.size.width * 0.28, y: geometry.size.height * 0.73)

                    Text("\(character.vigor)")
                        .position(x: geometry.size.width * 0.72, y: geometry.size.height * 0.73)
                }
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            }
            .frame(width: 100, height: 100)
        }
        .frame(width: 361)
        .padding(8)
        .background(
            Image(.corner)
                .resizable()
                .scaledToFill()
        )
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Character.self, configurations: config)
    
    let sampleCharacter = Character(name: "Gabriel", origin: .academic, clas: .specialist, trail: .infiltrator, nex: .fifty)
    
    return CardCharacter(character: sampleCharacter)
}
