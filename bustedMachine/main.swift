//
//  main.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

generateGameWorld()

let player = Player(name: "Avi", pronouns: "he/him/they", kind: .Monster, appearance: "You remind yourself what you look like. You have a short, rubbery snout, ending in a bright blue nose. Your hands have four fingers, and your feet have two toes. Your pointy ears swivel in the direction of sound. You are about 1.5 meters tall, all about. Tl; dr -- you are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a jock strap.", location: map.startingPoint, pockets: ["Pipe"])

player.tellUserYour("name")
player.tellUserYour("pronouns")
player.tellUserYour("inventory")
player.look()
