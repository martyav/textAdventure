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

class NonPlayer: Equatable, Character {
    var name: String
    var pronouns: [String]
    var kind: Kind
    var appearance: String
    var pockets: [String: Item]
    
    static func ==(lhs: NonPlayer, rhs: NonPlayer) -> Bool {
        return lhs.name == rhs.name &&
        lhs.appearance == rhs.appearance &&
        lhs.kind == lhs.kind
    }
    
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
    
    func changeName() {
        print("Your name is currently \(player.name). What would you like to change your name to?")
        print(">")
        let response = readLine()
        player.name = response?.capitalized ?? player.name
    }
    
    func changePronouns() {
        print("Your pronouns are currently \(player.pronouns.joined(separator: "/")). What would you like to change your pronouns to?")
        print(">")
        let response = readLine()
        player.pronouns = response?.components(separatedBy: "/") ?? player.pronouns
    }
    
    func travel(direction: String) -> Node? {
        guard let moveHere = Direction(rawValue: direction) else {
            return nil
        }
        
        switch moveHere {
        case .Left:
            guard let left = player.here.pathsOut.left else {
                return nil
            }
            
            return left
        case .Down:
            guard let down = player.here.pathsOut.down else {
                return nil
            }
            
            return down
        case .Right:
            guard let right = player.here.pathsOut.right else {
                return nil
            }
            
            return right
        case .Up:
            guard let up = player.here.pathsOut.up else {
                return nil
            }
            
            return up
        }
    }
}
