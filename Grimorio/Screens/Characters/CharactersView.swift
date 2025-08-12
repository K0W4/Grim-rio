//
//  Personagem-ES.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 07/08/25.
//

import SwiftUI
import SwiftData

struct CharactersView: View {
    @Environment(\.modelContext) var modelContext
    
    @State var addCharacter: Bool = false
    
    @State var characters: [Character] = [
        Character(name: "Lucas", origin: .academic, clas: .combatant, trail: .annihilator, nex: .eighty),
        Character(name: "Rafael", origin: .amnesic, clas: .occultist, trail: .conduit, nex: .sixty)
    ]
    
    var body: some View {
        NavigationStack {
            VStack() {
                if characters.isEmpty {
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
                        addCharacter = true
                    } label: {
                        ButtonApp(text: "Adicionar Personagem")
                    }
                    .padding(.top, 97)
                } else {
                    List(characters) { characters in
                        
                    }
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
                    addCharacter = true
                } label: {
                    Image(systemName: "plus.circle.fill")
                }
            }
        }
        .sheet(isPresented: $addCharacter) {
            CharactersAddView()
        }
    }
}

#Preview {
    NavigationStack {
        CharactersView()
    }
}
