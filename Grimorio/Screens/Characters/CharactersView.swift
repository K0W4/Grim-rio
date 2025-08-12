//
//  Personagem-ES.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 07/08/25.
//

import SwiftUI

struct CharactersView: View {    
    @State var addPersonagem: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 97) {
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
                            .font(.system(.body))
                            .foregroundStyle(.labelSecondary)
                            .multilineTextAlignment(.center)
                    }
                }
                
                Button {
                    addPersonagem = true
                } label: {
                    ButtonApp(text: "Adiconar Personagem")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, 97)
        .background(.backgroundPrimary)
        .navigationTitle(Text("Personagens"))
        .toolbarBackground(.backgroundSecondary, for: .navigationBar)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    addPersonagem = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        .sheet(isPresented: $addPersonagem) {
            PersonagensAddView()
        }
    }
}

#Preview {
    NavigationStack {
        CharactersView()
    }
}
