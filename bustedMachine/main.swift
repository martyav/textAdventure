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

let player = Player(name: name, pronouns: pronouns, kind: .Monster, appearance: "You have a short, rubbery snout, ending in a bright blue nose. Your hands have four fingers, and your feet have two toes. Your pointy ears swivel in the direction of sound. You are about 1.5 meters tall, all about. Tl;dr -- you are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a pair of boxer shorts.", location: map.startingPoint, pockets: [Pipe.name: Pipe, Lighter.name: Lighter, Key.name: Key])

let responder = InputResponder(player: player, area: map)

print(responder.respond(to: "help") + "\n")
responder.stackUp("help")
print(responder.respond(to: "down") + "\n")
responder.stackUp("down")
print(responder.respond(to: "repeat") + "\n")
print(responder.respond(to: "exits") + "\n")
