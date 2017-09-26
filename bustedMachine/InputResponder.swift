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
        , "drop"
        , "look"
        , "help"
        , "exits"
        , "exist"
        , "pockets"
        , "use"
        , "what's"
        , "what"
        , "where"
        , "who"
        , "change"
        , "say"
        , "left"
        , "down"
        , "right"
        , "up"
        , "quit"
    ]
    
    let ambleVerbs = [
        "go"
        , "head"
        , "walk"
        , "run"
        , "skip"
        , "jump"
        , "dance"
        , "amble"
        , "climb"
        , "jog"
        , "hop"
        , "sneak"
        , "strafe"
        , "travel"
        , "stomp"
    ]
    
    var previousCommand: String
    var instructionManual: InstructionManual
    
    init(instructionManual: InstructionManual, previousCommand: String = "") {
        self.instructionManual = instructionManual
        self.previousCommand = previousCommand
    }
    
    func stashLastCommand(_ input: String) {
        previousCommand = input
    }
    
    func repeatLast() -> String {
        if previousCommand != "" {
            return respond(to: previousCommand)
        }
        
        return "There's nothing to repeat."
    }
    
    func respond(to text: String) -> String {
        guard !text.isEmpty else {
            return "Type something!"
        }
        
        let input = text.lowercased()
        let individualWords = input.components(separatedBy: " ")
        let firstWord = individualWords[0]
        let lastWord = individualWords[individualWords.count - 1]
        
        guard keywords.contains(firstWord) || ambleVerbs.contains(firstWord) else {
            return "Huh?"
        }
        
        switch input {
        case _ where individualWords.count > 2 && (firstWord + " " + individualWords[1]) == "what's my":
            return instructionManual.whatsMy(lastWord)
        case _ where individualWords.count > 2 && (firstWord + " " + individualWords[1]) == "what is my":
            return instructionManual.whatsMy(lastWord)
        case _ where individualWords.count > 1 && ambleVerbs.contains(firstWord):
            return instructionManual.travel(lastWord)
        case _ where individualWords.count > 1 && firstWord == "say":
            let slice = ArraySlice<String>(individualWords[1..<individualWords.count])
            return instructionManual.say(slice.joined(separator: " "))
        case _ where individualWords.count > 1 && firstWord == "take":
            return instructionManual.take(lastWord)
        case _ where individualWords.count > 1 && firstWord == "drop":
            return instructionManual.drop(lastWord)
        case _ where individualWords.count > 1 && firstWord == "change":
            return instructionManual.change(lastWord)
        case _ where individualWords.count > 1 && firstWord == "use":
            return instructionManual.use(lastWord)
        case _ where individualWords.count > 1 && firstWord == "look":
            return instructionManual.look(at: lastWord)
        case "where am i", "where am i?", "where are we?", "where are we":
            return player.here.description
        case "what am i", "what am i?", "exist":
            return instructionManual.existentialism()
        case "help", "help!", "help?":
            return instructionManual.help()
        case "left", "right", "down", "up":
            return instructionManual.travel(input)
        case "repeat":
            return repeatLast()
        case "exits":
            return instructionManual.exits()
        case "pockets":
            return instructionManual.pockets()
        case "look":
            return instructionManual.look(at: player.here.location)
        case "quit":
            print("Bye, \(player.name)!")
            exit(0)
        default:
            return "What?"
        }
        
        return "?"
    }
}

