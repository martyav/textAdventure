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
    
    func tellUserYour(_ text: String) -> Void
}

class NonPlayer: Character {
    var name: String
    var pronouns: [String]
    var kind: Kind
    var appearance: String
    
    init(name: String, pronouns: String, kind: Kind, appearance: String = "A mysterious being.", pockets: [String] = []) {
        self.name = name
        self.pronouns = pronouns.components(separatedBy: "/")
        self.kind = kind
        self.appearance = appearance
    }
    
    func tellUserYour(_ text: String) {
        switch text {
        case "name":
            print("My name is \(name).")
        case "pronouns":
            print("My pronouns are \(pronouns.joined(separator: "/")).")
        default:
            print("What was that?")
        }
    }
}

class Player: Character {
    var name: String
    var pronouns: [String]
    var kind: Kind
    var appearance: String
    var currentLocation: Node
    var pockets: [String]
    
    init(name: String, pronouns: String, kind: Kind, appearance: String = "A mysterious being.", location: Node, pockets: [String] = []) {
        self.name = name
        self.pronouns = pronouns.components(separatedBy: "/")
        self.kind = kind
        self.appearance = appearance
        self.currentLocation = location
        self.pockets = pockets
    }
    
    func tellUserYour(_ text: String) {
        switch text {
        case "name":
            print("Your name is \(name).")
        case "pronouns":
            print("Your pronouns are \(pronouns.joined(separator: "/")).")
        case "inventory":
            print("You have", terminator: " ")
            guard pockets.count > 1 else {
                if let oneItem = pockets.first {
                    print("a \(oneItem) in your pockets.")
                } else {
                    print("nothing in your pockets.")
                }
                
                return
            }
            
            for (index, object) in pockets.enumerated() {
                if index == pockets.underestimatedCount {
                    print("and \(object)", terminator: " ")
                } else {
                    print(object, terminator: " ")
                }
            }
            print("in your pockets.")
        default:
            print("What was that?")
        }
    }
    
    func change(name: String) {
        self.name = name
    }
    
    func change(pronouns: String) {
        self.pronouns = pronouns.components(separatedBy: CharacterSet.punctuationCharacters)
    }
    
    func take(_ object: String) {
        guard pockets.count <= 6 else {
            print("Your pockets are full!")
            return
        }
        
        pockets.append(object)
    }
    
    func retrieve(_ object: String) -> String {
        if pockets.contains(object) {
            return object
        } else {
            return "You don't have that on hand right now!"
        }
    }
    
    func say(_ text: String) {
        print(say)
    }
    
    func look() {
        print(currentLocation.description)
    }
}
