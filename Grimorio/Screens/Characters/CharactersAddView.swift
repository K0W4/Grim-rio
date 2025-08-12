//
//  CharactersAddView.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 11/08/25.
//

import SwiftUI
import SwiftData
import PhotosUI

struct CharactersAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var selectedOrigin: Origin? = nil
    @State private var selectedClass: Class? = nil
    @State private var selectedTrail: Trail? = nil
    @State private var selectedNEX: NEX? = nil
    
    @State private var agility: Int = 0
    @State private var strength: Int = 0
    @State private var intellect: Int = 0
    @State private var presence: Int = 0
    @State private var vigor: Int = 0
    
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var characterImageData: Data?

    private var isFormValid: Bool {
        !name.isEmpty &&
        selectedOrigin != nil &&
        selectedClass != nil &&
        selectedTrail != nil &&
        selectedNEX != nil
    }

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
                        CustomPicker(title: "Origem", placeholder: "Selecione sua origem", selection: $selectedOrigin)
                        CustomPicker(title: "Classe", placeholder: "Selecione sua classe", selection: $selectedClass)
                        CustomPicker(title: "Trilha", placeholder: "Selecione sua trilha", selection: $selectedTrail)
                        CustomPicker(title: "NEX", placeholder: "Selecione seu NEX", selection: $selectedNEX)
                    }
                                    
                    // --- IMAGEM ---

                    Button {
                        addCharacter()
                    } label: {
                        ButtonApp(text: "Criar Personagem")
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Novo Personagem"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.backgroundSecondary, for: .navigationBar)
            .toolbarBackgroundVisibility(.visible, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "chevron.left")
                            Text("Voltar")
                        }
                        .foregroundStyle(.accent)
                    }
                }
            }
        }
    }
    
    private func addCharacter() {
        guard isFormValid,
              let origin = selectedOrigin,
              let clas = selectedClass,
              let trail = selectedTrail,
              let nex = selectedNEX
        else { return }
        
        let newCharacter = Character(name: name, origin: origin, clas: clas, trail: trail, nex: nex)
        
        newCharacter.agility = self.agility
        newCharacter.strength = self.strength
        newCharacter.intellect = self.intellect
        newCharacter.presence = self.presence
        newCharacter.vigor = self.vigor
        
        newCharacter.image = characterImageData
        
        modelContext.insert(newCharacter)
        
        do {
            try modelContext.save()
        } catch {
            print("Falha ao salvar o personagem: \(error.localizedDescription)")
        }
        
        dismiss()
    }
}

#Preview {
    CharactersAddView()
        .modelContainer(for: Character.self, inMemory: true)
}
