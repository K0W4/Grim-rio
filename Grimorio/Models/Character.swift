//
//  Character.swift
//  Grimorio
//
//  Created by Gabriel Kowaleski on 11/08/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
final class Character: Identifiable {
    var id: UUID
    var name: String
    var origin: Origin
    var clas: Class
    var trail: Trail
    var nex: NEX
    var protection: String
    var resistence: String
    var image: Data?
    
    init(name: String, origin: Origin, clas: Class, trail: Trail, nex: NEX) {
        self.id = UUID()
        self.name = name
        self.origin = origin
        self.clas = clas
        self.trail = trail
        self.nex = nex
        self.protection = ""
        self.resistence = ""
    }
}

enum Origin: String, Codable {
    case academic = "Acadêmico"
    case healthAgent = "Agente de Saúde"
    case amnesic = "Amnésico"
}

enum Class: String, Codable {
    case combatant = "Combatente"
    case specialist = "Especialista"
    case occultist = "Ocultista"
    case survivor = "Sobrevivente"
}

enum Trail: String, Codable {
    case annihilator = "Aniquilador"
    case fieldCommander = "Comandante de Campo"
    case warrior = "Guerreiro"
    case specialOperations = "Operações Especiais"
    case shockTroop = "Tropa de Choque"
    case sniper = "Atirador de Elite"
    case infiltrator = "Infiltrador"
    case fieldDoctor = "Médico de Campo"
    case negotiator = "Negociador"
    case technical = "Técnico"
    case conduit = "Conduíte"
    case flagellator = "Flagelador"
    case graduate = "Graduado"
    case intuitive = "Intuitivo"
    case paranormalBlade = "Lâmina Paranormal"
}

enum NEX: String, Codable {
    case zero = "0"
    case five = "5"
    case ten = "10"
    case fifteen = "15"
    case twenty = "20"
    case twentyFive = "25"
    case thirty = "30"
    case thirtyFive = "35"
    case forty = "40"
    case fortyFive = "45"
    case fifty = "50"
    case fiftyFive = "55"
    case sixty = "60"
    case sixtyFive = "65"
    case seventy = "70"
    case seventyFive = "75"
    case eighty = "80"
    case eightyFive = "85"
    case ninety = "90"
    case ninetyFive = "95"
    case ninetyNine = "99"
}
