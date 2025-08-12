//
//  CardExpertise.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 10/08/25.
//

import SwiftUI

struct CardExpertise: View {
    var name: String
    var die: String
    var bonus: String
    
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
                    Text(die)
                }
                
                Spacer()
                
                HStack() {
                    Text("Bônus:")
                        .fontWeight(.semibold)
                        .foregroundStyle(.labelSecondary)
                    Text(bonus)
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
    CardExpertise(name: "Acrobacia +", die: "Agilidade(1)", bonus: "+0")
}
