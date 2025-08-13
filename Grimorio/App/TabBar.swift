//
//  TabBar.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 12/08/25.
//

import SwiftUI

struct TabBar: View {
    enum Tab: CaseIterable {
        case inventario, ataques, ficha, pericias, habilidades
        
        var title: String {
            switch self {
            case .inventario:  return "Inventário"
            case .ataques:     return "Ataques"
            case .ficha:       return "Ficha"
            case .pericias:    return "Perícias"
            case .habilidades: return "Habilidades"
            }
        }
        
        var iconName: String {
            switch self {
            case .inventario:  return "backpack"
            case .ataques:     return "scroll"
            case .ficha:       return "person.text.rectangle"
            case .pericias:    return "list.bullet.clipboard"
            case .habilidades: return "burst"
            }
        }
    }
    
    @State private var selectedTab: Tab = .ficha

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Tab.allCases, id: \.self) { tab in
                tab.view
                    .tabItem {
                        Label(tab.title, systemImage: symbolName(for: tab))
                            .environment(\.symbolVariants, .none)
                    }
                    .tag(tab)
            }
        }
        .tint(.accentColor)
    }
    
    
    private func symbolName(for tab: Tab) -> String {
        let base = tab.iconName
        return selectedTab == tab ? "\(base).fill" : base
    }
}

private extension TabBar.Tab {
    @ViewBuilder
    var view: some View {
        switch self {
        case .ficha:
            CharactersView()
        case .inventario:
            InventoryEmptyView()
        case .habilidades:
            SkillsEmptyView()
        case .pericias:
            ExpertisesEmptyView()
        case .ataques:
            AttacksEmptyView()
        }
    }
}

#Preview {
    TabBar()
        .modelContainer(for: Character.self, inMemory: true)
}
