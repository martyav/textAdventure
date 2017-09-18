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
print(">")

let name = readLine()!.capitalized

print("\nAnd what pronouns would you like? For example -- (1) she/her/hers, (2) he/him/his, (3) they/them/their")
print("> ")

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

player.name = name
player.pronouns = pronouns.components(separatedBy: "/")

let responder = InputResponder(player: player, area: map)

print("")
responder.greeting()

while true {
    print(">")
    if let input = readLine() {
        print(responder.respond(to: input) + "\n")
        responder.previousCommand = input
    }
}
