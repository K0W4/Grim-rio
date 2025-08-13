//
//  ExpertisesEmptyView.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct ExpertisesEmptyView: View {
//    @Binding var addCharacter: Bool
    
    var body: some View {
        VStack {
            VStack(spacing: 38) {
                Image(.fear)
                    
                VStack {
                    Text("Sem personagens ainda!")
                        .font(.system(.body, weight: .semibold))
                        .foregroundStyle(.labelPrimary)
                    
                    Text("""
                            Adicione um novo personagem e
                            ele aparecerá aqui.
                        """)
                        .foregroundStyle(.labelSecondary)
                        .multilineTextAlignment(.center)
                }
            }
            
            Button {
//                addCharacter = true
            } label: {
                ButtonApp(text: "Adicionar Personagem")
            }
            .padding(.top, 97)
        }
    }
}

#Preview {
    ExpertisesEmptyView()
}
