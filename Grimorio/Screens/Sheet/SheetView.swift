//
//  SheetView.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI
import SwiftData

struct SheetView: View {
    @Bindable var character: Character
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditing = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                Attributes(character: character)
                
                VStack(spacing: 16) {
                    StatusControl(label: "Vida:", color: .life, currentValue: $character.currentLife, maxValue: character.maxLife)
                    StatusControl(label: "Sanidade:", color: .sanity, currentValue: $character.currentSanity, maxValue: character.maxSanity)
                    StatusControl(label: "PE:", color: .pe, currentValue: $character.currentPE, maxValue: character.maxPE)
                }

                HStack(spacing: 16) {
                    Defense(character: character)
                    FixStats(character: character)
                }
                                
                Protections(character: character)
                                
                OriginClassTrail(character: character)
            }
            .padding()
        }
        .background(Color.backgroundPrimary.ignoresSafeArea())
        .navigationTitle(character.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.backgroundSecondary, for: .navigationBar)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditing.toggle()
                } label: {
                    Image(systemName: "square.and.pencil")
                }
            }
        }
        .sheet(isPresented: $isEditing) {
            SheetEditView(character: character, onCharacterDeleted: {
                isEditing = false
            })
        }
    }
}

#Preview {
    NavigationStack {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Character.self, configurations: config)
        
        let sampleCharacter = Character(name: "Gebbedaya", origin: .academic, clas: .occultist, trail: .paranormalBlade, nex: .fifty)
        sampleCharacter.agility = 1
        sampleCharacter.strength = 2
        sampleCharacter.intellect = 5
        sampleCharacter.presence = 2
        sampleCharacter.vigor = 1
        sampleCharacter.currentLife = 40
        sampleCharacter.maxLife = 40
        sampleCharacter.currentSanity = 60
        sampleCharacter.maxSanity = 65
        sampleCharacter.currentPE = 60
        sampleCharacter.maxPE = 60
        
        container.mainContext.insert(sampleCharacter)
        
        return SheetView(character: sampleCharacter)
            .modelContainer(container)
    }
}
