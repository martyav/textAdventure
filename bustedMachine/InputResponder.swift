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
        "take"
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
    let player: Character
    
    init(player: Character, previousCommandStack: [String] = []) {
        self.player = player
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
        
        stackUp(input)
        
        switch input {
        case "what am i", "what am i?":
            return existentialism()
        case "help", "help!", "help?":
            return help()
        default:
            return "??"
        }
    }
    
    func help() -> String {
        return "Here are a list of commands you can do: \n * look -- look around your current location\n * look at ___ -- look at an object, direction, or character\n * exits -- see all the exits\n * left, right, up, or down -- travel in that direction (from a 2D, top-down perspective)\n * take ___ -- put an object inside your fanny pack\n * use ___ -- use an object in your fanny pack\n * what's my ___ -- ask a personal question\n * quit -- quit the game\n"
    }
    
    func existentialism() -> String {
        return "You are a \(player.kind)."
    }
}

