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
        var newMap: Graph
        var newManual: InstructionManual
        
        switch player.here {
        case weedyField:
            if instructionManual is Area1 == false {
                newMap = generateArea1()
                newManual = Area1(player: player, area: newMap)
                costumeArea1Cast()
                self.instructionManual = newManual
                self.area = newMap
            }
        case cityLimits:
            if instructionManual is Area2 == false {
                newMap = generateArea2()
                newManual = Area2(player: player, area: newMap)
                self.instructionManual = newManual
                self.area = newMap
            }
        case baseOfSpire:
            if instructionManual is Area3 == false {
                newMap = generateArea3()
                newManual = Area3(player: player, area: newMap)
                self.instructionManual = newManual
                self.area = newMap
            }
        default:
            print("")
        }
    }
    
    func respond(to text: String) -> String {
        guard !text.isEmpty else {
            return "Type something!"
        }
        
        let input = text.lowercased()
        let individualWords = input.components(separatedBy: " ")
        let firstWord = individualWords[0]
        let lastWord = individualWords[individualWords.count - 1]
        
        let allowableWords = instructionManual.keywords + instructionManual.magicwords + instructionManual.synonymsForTravel
        
        guard allowableWords.contains(firstWord) else {
            return "Huh?"
        }
        
        switch input {
        case _ where individualWords.count > 2 && (firstWord + " " + individualWords[1]) == "what's my":
            return instructionManual.whatsMy(lastWord)
        case _ where individualWords.count > 3 && (firstWord + " " + individualWords[1] + " " + individualWords[2]) == "what is my":
            return instructionManual.whatsMy(lastWord)
        case _ where individualWords.count > 3 && (firstWord + " " + individualWords[1] + " " + individualWords[2]) == "what are my":
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
        case _ where instructionManual.magicwords.contains(firstWord):
            return instructionManual.magic(input)
        case "repeat":
            return repeatLast()
        case "exits":
            return instructionManual.exits()
        case "pockets":
            return instructionManual.pockets()
        case "look":
            return instructionManual.look(at: player.here.location)
        case "change", "take", "use", "say":
            return "You need to tell me what to \(input)."
        case "quit":
            quit()
        default:
            return "What?"
        }
        
        return "?"
    }
}
