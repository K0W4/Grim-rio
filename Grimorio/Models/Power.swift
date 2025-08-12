//
//  Powers.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 09/08/25.
//

import Foundation
import SwiftData

@Model
final class Powers: Identifiable {
    var id: UUID
    var name: String
    var desc: String
    
    init(name: String, desc: String) {
        self.id = UUID()
        self.name = name
        self.desc = desc
    }
}
