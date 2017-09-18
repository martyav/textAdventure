//
//  Character.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

protocol Character {
    var name: String { get set }
    var kind: Kind { get }
    var appearance: String { get }
}

class NonPlayer: Character {
    var name: String
    var pronouns: [String]
    var kind: Kind
    var appearance: String
    var pockets: [String: Item]
    
    init(name: String, pronouns: String, kind: Kind, appearance: String = "A mysterious being.", pockets: [String: Item] = [:]) {
        self.name = name
        self.pronouns = pronouns.components(separatedBy: "/")
        self.kind = kind
        self.appearance = appearance
        self.pockets = pockets
    }
    
    func tellUserYour(_ text: String) -> String {
        switch text {
        case "name":
            return "My name is \(name)."
        case "pronouns":
            return "My pronouns are \(pronouns.joined(separator: "/"))."
        default:
            return "What was that?"
        }
    }
}

class Player: Character {
    var name: String
    var pronouns: [String]
    var kind: Kind
    var appearance: String
    var here: Node
    var pockets: [String: Item]
    
    init(name: String, pronouns: String, kind: Kind, appearance: String = "A mysterious being.", location: Node, pockets: [String: Item] = [:]) {
        self.name = name
        self.pronouns = pronouns.components(separatedBy: "/")
        self.kind = kind
        self.appearance = appearance
        self.here = location
        self.pockets = pockets
    }

    func take(_ object: Item) {
        guard player.pockets.count < 6 else {
            return
        }
        
        pockets[object.name] = object
        
        if !object.isReplenishable() {
            player.here.objects.removeValue(forKey: object.name)
        }
    }
    
    func drop(_ object: Item) {
        player.here.objects[object.name] = object
        player.pockets.removeValue(forKey: object.name)
    }
}
