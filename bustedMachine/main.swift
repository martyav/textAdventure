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
print("And what pronouns would you like? He/him, she/her, they/them")
let pronouns = readLine()!

let player = Player(name: name, pronouns: pronouns, kind: .Monster, appearance: "You remind yourself what you look like. You have a short, rubbery snout, ending in a bright blue nose. Your hands have four fingers, and your feet have two toes. Your pointy ears swivel in the direction of sound. You are about 1.5 meters tall, all about. Tl;dr -- you are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a pair of shorts.", location: map.startingPoint, pockets: ["PIPE"])

print("Hi, \(player.name)! \n")
player.tellUserYour("appearance")
print("")
player.tellUserYour("inventory")
print("")
player.look()
print("")
print("You can look, check for exits, go left down right up, or quit. \n")

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
    
    switch input {
    case "look":
        player.look()
    case "check":
        player.checkForExits()
    case "quit":
        exit(0)
    default:
        print("I don't understand.")
    }
}
