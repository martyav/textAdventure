//
//  main.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

generateGameWorld()

print("Hello. What is your name?")
print("> ")
let name = readLine()!.capitalized
print("And what pronouns would you like? For example -- (1) she/her/hers, (2) he/him/his, (3) they/them/their")
var pronouns = readLine()!
if let response = Int(pronouns) {
    switch response {
    case 1:
        pronouns = "she/her/hers"
    case 2:
        pronouns = "he/him/his"
    case 3:
        pronouns = "they/them/their"
    default:
        break
    }
}

let Pipe: Item = Item(name: "PIPE", description: "This is a little aluminum pipe. For tobacco use only?", pocketable: true)
let Lighter: Item = Item(name: "LIGHTER", description: "This is a lighter. It has a colorful illustration of pegasus on it.", pocketable: true)
let Key: Item = Item(name: "KEY", description: "This is a key. It's silvery and has a little dab of red nail polish on it.", pocketable: true)

let player = Player(name: name, pronouns: pronouns, kind: .Monster, appearance: "You have a short, rubbery snout, ending in a bright blue nose. Your hands have four fingers, and your feet have two toes. Your pointy ears swivel in the direction of sound. You are about 1.5 meters tall, all about. Tl;dr -- you are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a pair of boxer shorts.", location: map.startingPoint, pockets: [Pipe.name: Pipe, Lighter.name: Lighter, Key.name: Key])

print("Hi, \(player.name)! \n")
player.tellUserYour("kind")
print("")
player.tellUserYour("appearance")
print("")
player.tellUserYour("inventory")
print("")
player.look()
print("")
print("You can LOOK, check for EXITS, check your POCKETS, go LEFT DOWN RIGHT or UP, or QUIT. \n")

while true {
    print("> ")
    let input = readLine()!.lowercased()
    
    let check = input.components(separatedBy: " ")
    
    if input.contains("left") {
        player.travel(to: .Left)
        continue
    } else if input.contains("down") {
        player.travel(to: .Down)
        continue
    } else if input.contains("right") {
        player.travel(to: .Right)
        continue
    } else if input.contains("up") {
        player.travel(to: .Up)
        continue
    }
    
    let lookAt = try! NSRegularExpression(pattern: "\\b(look at)\\b", options: .caseInsensitive)
    let lookAtMatch = lookAt.matches(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count))
    
    
    
    if !lookAtMatch.isEmpty {
        let object = check.last!
        
        switch object {
        case "yourself", "mirror", "reflection":
            player.tellUserYour("name")
            player.tellUserYour("description")
        case player.here.location, "around":
            player.look()
        case "pipe":
            Pipe.printName()
            Pipe.printDescription()
        case "lighter":
            Lighter.printName()
            Lighter.printDescription()
        case "key":
            Key.printName()
            Key.printDescription()
        default:
            print("You can't look at that.")
        }
    }
    
    if check.count == 1 {
        
        switch input {
        case "look":
            player.look()
        case "exits":
            player.checkForExits()
        case "pockets":
            player.tellUserYour("inventory")
        case "quit":
            exit(0)
        default:
            print("I don't understand.")
        }
    }
}
