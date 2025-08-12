//
//  CardItem.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 10/08/25.
//

import SwiftUI

struct CardItem: View {
    var name: String
    var category: Category
    var space: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.card)
                .foregroundStyle(.labelPrimary)
            
            HStack() {
                HStack() {
                    Text("Dados:")
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelSecondary)
                    Text(category.rawValue)
                }
                
                Spacer()
                
                HStack() {
                    Text("Bônus:")
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelSecondary)
                    Text(space)
                }
            }
            .padding(.horizontal, 4)
            .frame(width: 345, alignment: .leading)
        }
        .frame(width: 345, height: 70, alignment: .leading)
        .background(
            Image(.corner)
                .resizable()
                .frame(width: 361, height: 79)
        )
    }
}

#Preview {
    CardItem(name: "Espada", category: .III, space: "1")
}
