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
    
    @Query(sort: \Character.name) private var characters: [Character]
    
    @State var addCharacter: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack() {
                if characters.isEmpty {
                    CharactersEmptyView(addCharacter: $addCharacter)
                } else {
                    ScrollView {
                        VStack(spacing: 16) {
                            ForEach(characters) { character in
                                NavigationLink(destination: SheetView(character: character)) {
                                    CardCharacter(character: character)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.top, characters.isEmpty ? 97 : 24)
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
