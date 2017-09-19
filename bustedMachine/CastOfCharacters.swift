//
//  CastOfCharacters.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/17/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let player = Player(name: "???", pronouns: "who/whom/whose", kind: .Monster, appearance: "You have a short, rubbery snout, ending in a bright blue nose. Your hands have four fingers, and your feet have two toes. Your pointy ears swivel in the direction of sound. You are about 1.5 meters tall, all about.\n\nTl;dr -- you are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a pair of boxer shorts.", location: map.startingPoint, pockets: [Key.name: Key])

let Werewolf = NonPlayer(name: "Jim", pronouns: "he/him/his", kind: .Robot, appearance: "Jim is a Monster. He has big googly eyes, big floppy ears, and a long snout. He is covered in blue fur. He wears a flannel shirt, a fanny pack, cargo shorts, and white socks with black sandals.", pockets: [Lighter.name: Lighter])
