//
//  CastOfCharacters.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/17/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let player = Player(name: "???", pronouns: PronounSet.who, kind: .Monster, appearance: "You are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a pair of boxer shorts.", location: map.startingPoint, pockets: [Key.name: Key])

let Werewolf = NonPlayer(name: "Luvox", pronouns: PronounSet.randomPick(), kind: .Monster, appearance: "", pockets: [Lighter.name: Lighter])
