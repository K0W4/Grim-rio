//
//  PersonagensAddView.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 07/08/25.
//

import SwiftUI

struct CharactersAddView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Nome:")
                            .font(.system(.body, weight: .semibold))
                        
                        TextField("Digite o nome do seu personagem", text: .constant(""))
                            .foregroundStyle(.labelSecondary)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(.backgroundTertiary))
                    }
                    
                    ZStack {
                        Image(.attributes)
                        
                        VStack() {
                            HStack {
                                Button {
                                    
                                } label: {
                                    Text("-")
                                        .foregroundColor(.red)
                                }
                                
                                Text("0")
                                    .foregroundStyle(.red)
                                
                                Button {
                                    
                                } label: {
                                    Text("+")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Origem:")
                            .font(.system(.body, weight: .semibold))
                    }
                }
            }
            .padding(.vertical, 24)
            .padding(.horizontal)
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
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Text("Adicionar")
                    }
                }
            }

        }
    }
}

#Preview {
    NavigationStack {
        CharactersAddView()
    }
}
