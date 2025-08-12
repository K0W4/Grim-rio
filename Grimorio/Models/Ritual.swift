//
//  Ritual.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 09/08/25.
//

import Foundation
import SwiftData

@Model
final class Ritual: Identifiable {
    var id: UUID
    var name: String
    var element: Element
    var circle: Circle
    var execution: Execution
    var range: Range
    var duration: String
    var target: String
    var desc: String
    var studentVersion: String
    var trueVersion: String
    
    init(name: String, element: Element, circle: Circle, execution: Execution, range: Range, duration: String, target: String, desc: String, studentVersion: String, trueVersion: String) {
        self.id = UUID()
        self.name = name
        self.element = element
        self.circle = circle
        self.execution = execution
        self.range = range
        self.duration = duration
        self.target = target
        self.desc = desc
        self.studentVersion = studentVersion
        self.trueVersion = trueVersion
    }
}

enum Element: String, Codable {
    case death = "Morte"
    case blood = "Sangue"
    case fear = "Medo"
    case nowledge = "Conhecimento"
    case energie = "Energia"
}

enum Circle: String, Codable {
    case first = "1º"
    case second = "2º"
    case third = "3º"
    case fourth = "4º"
}

enum Execution: String, Codable {
    case standard = "Padrão"
    case reaction = "Reação"
    case complete = "Completa"
    case free = "Livre"
}

enum Range: String, Codable {
    case personal = "Pessoal"
    case touch = "Toque"
    case short = "Curto"
    case medium = "Médio"
    case long = "Longo"
    case extreme = "Extremo"
    case unlimited = "Ilimitado"
}
