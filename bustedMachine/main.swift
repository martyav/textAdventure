//
//  main.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let map = generateArea1()

print("Hello. What is your name?")
print(">")

let name = readLine()!.capitalized

print("\nAnd what pronouns would you like? For example -- (1) she/her/hers, (2) he/him/his, (3) they/them/their")
print("> ")

var pronouns = readLine()!

if let response = Int(pronouns) {
    switch response {
    case 1:
        pronouns = PronounSet.she
    case 2:
        pronouns = PronounSet.he
    case 3:
        pronouns = PronounSet.they
    default:
        break
    }
}

player.name = name
player.pronouns = pronouns.components(separatedBy: "/")

let responder = InputResponder(player: player, area: map)

print("")

print("Welcome, \(player.name)!\n")
print("You are a \(player.kind). \n")
print(player.appearance + "\n")
print(responder.respond(to: "help"))
print("\n" + player.here.description + "\n")
print(responder.respond(to: "pockets") + "\n")

while true {
    responder.rtfm()
    
    print(">")
    
    if let input = readLine() {
        print(responder.respond(to: input) + "\n")
        responder.stashLastCommand(input)
    }
}
