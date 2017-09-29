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

let Cookiepuss = NonPlayer(name: "Cookiepuss", pronouns: PronounSet.he, kind: .Monster)

let Possum = NonPlayer(name: "Possum", pronouns: PronounSet.she, kind: .Monster)

let FutureCreep = NonPlayer(name: "Future", pronouns: PronounSet.ze, kind: .Monster)

let AnonymousActor1 = NonPlayer(name: "Fosco Filanthro", pronouns: PronounSet.e, kind: .Hatchasee)

let AnonymousActor2 = NonPlayer(name: "Bernice Ng", pronouns: PronounSet.she, kind: .Greffle)

let AnonymousActor3 = NonPlayer(name: "Chilterverk", pronouns: PronounSet.he, kind: .Tresson)

func randomlyPickActor() -> NonPlayer {
    AnonymousActor1.appearance = "\(AnonymousActor1.name) is an unusually tall and slender Hatchasee actor. \(AnonymousActor1.pronouns[0].capitalized) often plays Human teens, even though \(AnonymousActor1.pronouns[0]) is currently 47. In this episode, \(AnonymousActor1.pronouns[0]) is playing the role of Elijah Wood, a classical actor. It is a period drama about Hollywood."
    AnonymousActor2.appearance = "\(AnonymousActor2.name) is a delicately beautiful Greffle actor. \(AnonymousActor2.pronouns[0].capitalized) often plays action heroes, but \(AnonymousActor1.pronouns[0]) has started moving into romantic lead roles. It's a difficult balancing act, which infuses \(AnonymousActor1.pronouns[2]) roles with a great deal of poignancy."
    AnonymousActor3.appearance = "\(AnonymousActor3.name) is a famous Tresson entertainer. \(AnonymousActor3.pronouns[2].capitalized) main claim to fame is that \(AnonymousActor3.pronouns[0]) is hugely muscular. There is a small yet vocal subculture of Human and Hatchasee fans who find \(AnonymousActor3.pronouns[1]) very, VERY attractive. \(AnonymousActor3.name) is, ironically, considered very ugly by Tresson standards, though."
    
    let actors = [AnonymousActor1, AnonymousActor2, AnonymousActor3]
    let randomNumber = Int(arc4random_uniform(UInt32(3)))
    
    return actors[randomNumber]
}
