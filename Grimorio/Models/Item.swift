//
//  Item.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 09/08/25.
//

import Foundation
import SwiftData

@Model
final class Item: Identifiable {
    var id: UUID
    var name: String
    var category: Category
    var space: String
    
    init(name: String, category: Category, space: String) {
        self.id = UUID()
        self.name = name
        self.category = category
        self.space = space
    }
}

enum Category: String, Codable {
    case zero = "0"
    case I = "I"
    case II = "II"
    case III = "III"
    case IV = "IV"
}
