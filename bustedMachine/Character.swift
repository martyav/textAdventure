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
    var here: Node
    var pockets: [String]
    
    init(name: String, pronouns: String, kind: Kind, appearance: String = "A mysterious being.", location: Node, pockets: [String] = []) {
        self.name = name
        self.pronouns = pronouns.components(separatedBy: "/")
        self.kind = kind
        self.appearance = appearance
        self.here = location
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
                    print("a \(oneItem) in your fanny pack.")
                } else {
                    print("nothing in your fanny pack.")
                }
                
                return
            }
            
            for (index, object) in pockets.enumerated() {
                if index == pockets.underestimatedCount {
                    print("and a \(object)", terminator: " ")
                } else {
                    print("a \(object)", terminator: " ")
                }
            }
            
            print("in your fanny pack.")
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
        map.printDescription(here.location)
    }
    
    func checkForExits() {
        print("You check for exits: ")
        map.printConnections(here.location)
    }
    
    func travel(to direction: Direction) {
        print("You go \(String(describing: direction).uppercased()).")
        
        switch direction {
        case .Left:
            guard let left = here.pathsOut.left else {
                print("You can't go there!")
                return
            }
            
            here = left
        case .Down:
            guard let down = here.pathsOut.down else {
                print("You can't go there!")
                return
            }
            
            here = down
        case .Right:
            guard let right = here.pathsOut.right else {
                print("You can't go there!")
                return
            }
            
            here = right
        case .Up:
            guard let up = here.pathsOut.up else {
            print("You can't go there!")
            return
        }
        
        here = up
        }
        
        map.printDescription(here.location)
    }
}
