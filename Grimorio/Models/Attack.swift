//
//  Attack.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 09/08/25.
//

import Foundation
import SwiftData

@Model
final class Attack: Identifiable {
    var id: UUID
    var name: String
    var test: String
    var damage: String
    var critical: String
    
    init(name: String, test: String, damage: String, critical: String) {
        self.id = UUID()
        self.name = name
        self.test = test
        self.damage = damage
        self.critical = critical
    }
}
