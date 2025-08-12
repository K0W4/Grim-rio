//
//  CardExpertise.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 10/08/25.
//

import SwiftUI

struct CardExpertiseEdit: View {
    var name: String
    var bonus: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.card)
                .foregroundStyle(.labelPrimary)
            
            HStack() {
                Text("Bônus:")
                    .fontWeight(.semibold)
                    .foregroundStyle(.labelSecondary)
                Text(bonus)
            }
            
            .padding(.horizontal, 4)
            .frame(width: 345, alignment: .center)
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
    CardExpertiseEdit(name: "Acrobacia +", bonus: "+0")
}
