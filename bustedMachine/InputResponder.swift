//
//  InputParser.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

class InputResponder {
    var player: Player
    var area: Graph
    var previousCommand: String
    var instructionManual: InstructionManual
    
    init(player: Player, area: Graph, previousCommand: String = "") {
        self.player = player
        self.area = area
        self.previousCommand = previousCommand
        
        let defaults = BasicInstructions(player: self.player, area: self.area)
        
        self.instructionManual = defaults
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
    
    func quit() {
        print("Bye, \(player.name)!")
        exit(0)
    }
    
    func rtfm() {
        let area1 = Area1(player: player, area: map)
        
        switch player.here {
        case weedyField:
            // some check to see if we are already using the correct manual
            instructionManual = area1
        default:
            print("")
        }
        
        print(instructionManual)
    }
    
    func respond(to text: String) -> String {
        guard !text.isEmpty else {
            return "Type something!"
        }
        
        let input = text.lowercased()
        let individualWords = input.components(separatedBy: " ")
        let firstWord = individualWords[0]
        let lastWord = individualWords[individualWords.count - 1]
        
        guard instructionManual.keywords.contains(firstWord) else {
            return "Huh?"
        }
        
        switch input {
        case _ where individualWords.count > 2 && (firstWord + " " + individualWords[1]) == "what's my":
            return instructionManual.whatsMy(lastWord)
        case _ where individualWords.count > 2 && (firstWord + " " + individualWords[1]) == "what is my":
            return instructionManual.whatsMy(lastWord)
        case _ where individualWords.count > 1 && instructionManual.synonymsForTravel.contains(firstWord):
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
            quit()
        default:
            return "What?"
        }
        
        return "?"
    }
}
