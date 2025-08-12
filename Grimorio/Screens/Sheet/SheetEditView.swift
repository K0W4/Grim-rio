//
//  SheetEditView.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct SheetEditView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    let character: Character
    
    var onCharacterDeleted: () -> Void
    
    @State private var name: String = ""
    @State private var agility: Int = 0
    @State private var strength: Int = 0
    @State private var intellect: Int = 0
    @State private var presence: Int = 0
    @State private var vigor: Int = 0
    @State private var protection: String = ""
    @State private var resistence: String = ""
    @State private var origin: Origin?
    @State private var clas: Class?
    @State private var trail: Trail?
    @State private var nex: NEX?
    @State private var showingDeleteAlert = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {
                    VStack(alignment: .leading){
                        Text("Nome:")
                            .font(.system(.body, weight: .semibold))
                        TextField("Nome do seu personagem", text: $name)
                            .foregroundStyle(.labelPrimary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.backgroundTertiary))
                    }
                
                    ZStack {
                        Image("attributes")
                            .resizable()
                            .scaledToFit()

                        GeometryReader { geometry in
                            AttributeControl(value: $agility)
                                .position(x: geometry.size.width * 0.5, y: geometry.size.height * 0.16)

                            AttributeControl(value: $strength)
                                .position(x: geometry.size.width * 0.20, y: geometry.size.height * 0.37)

                            AttributeControl(value: $intellect)
                                .position(x: geometry.size.width * 0.81, y: geometry.size.height * 0.37)

                            AttributeControl(value: $presence)
                                .position(x: geometry.size.width * 0.29, y: geometry.size.height * 0.75)

                            AttributeControl(value: $vigor)
                                .position(x: geometry.size.width * 0.72, y: geometry.size.height * 0.75)
                        }
                    }
                    .frame(height: 361)
                    
                    VStack(spacing: 16) {
                        VStack(alignment: .leading){
                            Text("Proteção:")
                                .font(.system(.body, weight: .semibold))
                            TextField("Suas proteções", text: $protection)
                                .foregroundStyle(.labelPrimary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(.backgroundTertiary))
                        }
                        VStack(alignment: .leading){
                            Text("Resistências:")
                                .font(.system(.body, weight: .semibold))
                            TextField("Suas resistências", text: $resistence)
                                .foregroundStyle(.labelPrimary)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 8)
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(.backgroundTertiary))
                        }
                    }
                    
                    VStack(spacing: 16) {
                        CustomPicker(title: "Origem", placeholder: "Selecione sua origem", selection: $origin)
                        CustomPicker(title: "Classe", placeholder: "Selecione sua classe", selection: $clas)
                        CustomPicker(title: "Trilha", placeholder: "Selecione sua trilha", selection: $trail)
                        CustomPicker(title: "NEX", placeholder: "Selecione seu NEX", selection: $nex)
                    }
                                    
                    ZStack {
                        Image(.deleteCorner)
                        
                        Button(role: .destructive) {
                            showingDeleteAlert = true
                        } label: {
                            Text("Deletar Personagem")
                                .font(.button)
                                .foregroundStyle(.delete)
                        }
                    }

                }
                .padding()
            }
            .navigationTitle("Editar Personagem")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Concluir") {
                        saveChanges()
                        dismiss()
                    }
                }
            }
            .onAppear(perform: setupInitialState)
            .alert("Deletar Personagem", isPresented: $showingDeleteAlert) {
                Button("Deletar", role: .destructive) {
                    deleteCharacter()
                }
                Button("Cancelar", role: .cancel) { }
            } message: {
                Text("""
                        Tem certeza que deseja deletar seu personagem? 
                        Esta ação é irreversível.
                    """)
            }
        }
    }
    
    private func setupInitialState() {
        name = character.name
        agility = character.agility
        strength = character.strength
        intellect = character.intellect
        presence = character.presence
        vigor = character.vigor
        protection = character.protection
        resistence = character.resistence
        origin = character.origin
        clas = character.clas
        trail = character.trail
        nex = character.nex
    }
    
    private func saveChanges() {
        character.name = name
        character.agility = agility
        character.strength = strength
        character.intellect = intellect
        character.presence = presence
        character.vigor = vigor
        character.protection = protection
        character.resistence = resistence
        if let origin { character.origin = origin }
        if let clas { character.clas = clas }
        if let trail { character.trail = trail }
        if let nex { character.nex = nex }
    }
    
    private func deleteCharacter() {
        modelContext.delete(character)
        onCharacterDeleted()
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Character.self, configurations: config)
    
    let sampleCharacter = Character(name: "Gebbedaya", origin: .academic, clas: .occultist, trail: .paranormalBlade, nex: .fifty)
    container.mainContext.insert(sampleCharacter)
    
    return SheetEditView(character: sampleCharacter, onCharacterDeleted: {})
        .modelContainer(container)
}
