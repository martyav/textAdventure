//
//  InputParser.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

class InputResponder {
    let keywords = [
        "repeat"
        ,"take"
        , "look"
        , "help"
        , "exits"
        , "pockets"
        , "use"
        , "what"
        , "who"
        , "change"
        , "say"
        , "left"
        , "down"
        , "right"
        , "up"
    ]
    
    var previousCommandStack: [String]
    let player: Player
    var area: Graph
    
    init(player: Player, area: Graph, previousCommandStack: [String] = []) {
        self.player = player
        self.area = area
        self.previousCommandStack = previousCommandStack
    }
    
    func stackUp(_ input: String) {
        previousCommandStack.append(input)
    }
    
    func caseDown(_ text: String) -> String {
        return text.lowercased()
    }
    
    func breakUp(_ text: String) -> [String] {
        return text.components(separatedBy: " ")
    }
    
    func respond(to text: String) -> String {
        let input = caseDown(text)
        let array = breakUp(input)
        
        guard keywords.contains(array[0]) else {
            return "Huh?"
        }
        
        switch input {
        case "repeat":
            return repeatLast()
        case "what am i", "what am i?", "exists":
            return existentialism()
        case "help", "help!", "help?":
            return help()
        case "left", "right", "down", "up":
            return travel(input)
        case "exits":
            return exits()
        case "pockets":
            return pockets()
        case "quit":
            print("Bye, \(player.name)!")
            exit(0)
        case "look":
            return look(at: array[array.count - 1])
        default:
            return "??"
        }
        
        return "?"
    }
    
    func help() -> String {
        return "Here are a list of commands you can use: \n * look -- look around your current location\n * look at ___ -- look at an object, direction, or character\n * exits -- see all the exits\n * left, right, up, or down -- travel in that direction (from a 2D, top-down perspective)\n * pockets -- check your fanny pack's pockets\n * take ___ -- put an object inside your fanny pack\n * use ___ -- use an object in your fanny pack\n * what's my ___ -- ask a personal question\n * repeat -- repeat the last command\n * quit -- quit the game\n"
    }
    
    func repeatLast() -> String {
        if let lastCommand = previousCommandStack.last {
            return respond(to: lastCommand)
        } else {
            return "There's nothing to repeat."
        }
    }
    
    func exits() -> String {
        let name = player.here.location
        
        if let found = area.allNames[name] {
            let placeholder = "deadend"
            let spaces = String(repeating: " ", count: found.pathsOut.left?.location.characters.count ?? placeholder.characters.count)
            
            return "You check for exits:\n\n\(spaces)UP: \(found.pathsOut.up?.location ?? placeholder)\nLEFT: \(found.pathsOut.left?.location ?? placeholder) + RIGHT: \(found.pathsOut.right?.location ?? placeholder)\n\(spaces)DOWN: \(found.pathsOut.down?.location ?? placeholder)"
        } else {
            return "We can't find \(name) on the map."
        }
    }
    
    func pockets() -> String {
        var buildString: [String] = []
        
        buildString.append("You have")
        
        guard player.pockets.count > 1 else {
            if let oneItem = player.pockets.first {
                buildString.append("a \(oneItem.key) in your fanny pack.")
            } else {
                buildString.append("nothing in your fanny pack.")
            }
            
            return buildString.joined(separator: " ")
        }
        
        for (index, object) in player.pockets.enumerated() {
            if index == player.pockets.count - 1 {
                buildString.append("and a \(object.key)")
            } else {
                buildString.append("a \(object.key),")
            }
        }
        
        buildString.append("in your fanny pack.")
        
        return buildString.joined(separator: " ")
    }
    
    func travel(_ direction: String) -> String {
        let error = "You can't go there!"
        
        switch direction {
        case "left":
            guard let left = player.here.pathsOut.left else {
                return error
            }
            
            player.here = left
        case "down":
            guard let down = player.here.pathsOut.down else {
                return error
            }
            
            player.here = down
        case "right":
            guard let right = player.here.pathsOut.right else {
                return error
            }
            
            player.here = right
        case "up":
            guard let up = player.here.pathsOut.up else {
                return error
            }
            
            player.here = up
        default:
            return error
        }
        
        return "You go \(direction.uppercased()).\n\(player.here.description)"
    }
    
    func look(at name: String) -> String {
        print(name)
        /*
        if let found = area.allNames[name] {
            return found.description
        } else if let found = player.here.objects[name.uppercased()] {
            return found.description
        } else if let found = player.pockets[name.uppercased()] {
            return found.description
        }
 */
        
        switch name {
        case "yourself", "mirror", "reflection":
            return player.appearance
        case "around":
            return player.here.description
        case "left":
            if let left = player.here.pathsOut.left {
                return "You see a \(left.location)."
            } else {
                return "You see a deadend"
            }
        case "down":
            if let down = player.here.pathsOut.down {
                return "You see a \(down.location)."
            } else {
                return "You see a deadend"
            }
        case "right":
            if let right = player.here.pathsOut.right {
                return "You see a \(right.location)."
            } else {
                return "You see a deadend"
            }
        case "up":
            if let up = player.here.pathsOut.up {
                return "You see a \(up.location)."
            } else {
                return "You see a deadend"
            }
        case "pockets":
            return pockets()
        default:
            return "We can't see anything."
        }
    }
    
    func existentialism() -> String {
        return "Your name is \(player.name) and you are a \(player.kind).\n \(player.appearance)"
    }
}

