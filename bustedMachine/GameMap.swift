//
//  GameMap.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation


func generateArea1() -> Graph {
    Werewolf.appearance = "\(Werewolf.name) is a Monster. \(Werewolf.pronouns[0].capitalized) has big googly eyes, floppy ears, and a long snout. \(Werewolf.pronouns[0].capitalized) is covered in blue fur. \(Werewolf.pronouns[0].capitalized) wears a flannel shirt, a fanny pack, cargo shorts, and white socks with black sandals."
    Cookiepuss.appearance = "\(Cookiepuss.name) is a Monster. \(Cookiepuss.pronouns[0].capitalized) has big, googly eyes, shaggy orange hair, droopy pink eyelids, and a crooked pink nose. \(Cookiepuss.pronouns[0].capitalized) is covered in pink felt and orange fur. \(Cookiepuss.pronouns[0].capitalized) wears a purple trucker cap, black high-top sneakers, a fanny pack, and a jock strap."
    Possum.appearance = "\(Possum.name) is a Monster. \(Possum.pronouns[0].capitalized) has big, googly eyes, a pointy snout, spiky green hair, and black bat-like ears. \(Possum.pronouns[0].capitalized) is covered in stained white felt. \(Possum.pronouns[0].capitalized) wears a septum piercing, fishnets, a fanny pack, leather hot pants, and black boots."
    FutureCreep.appearance = "\(FutureCreep.name) is a Monster. \(FutureCreep.pronouns[0].capitalized) has square eyes attached to an eyeglass frame, bob-cut blue hair, and thick eyebrows. \(FutureCreep.pronouns[0].capitalized) is covered in bluish green fur. \(FutureCreep.pronouns[0].capitalized) wears an open flannel shirt, a tie-dye shirt, a fanny pack, and green cut-off jeans."
    
    let map = Graph(startingPoint: weedyField)
    
    map.add(newNode: nearHighway, to: weedyField, at: .Left)
    map.add(newNode: farHighway, to: nearHighway, at: .Up)
    map.add(newNode: fartherHighway, to: farHighway, at: .Up)
    map.add(newNode: farthestHighway, to: fartherHighway, at: .Up)
    // map.add(newNode: farthestHighway, to: farthestHighway, at: .Up)
    map.add(newNode: forest, to: farHighway, at: .Right)
    map.add(newNode: forest, to: weedyField, at: .Up)
    map.add(newNode: deepForest, to: forest, at: .Right)
    map.add(newNode: clearing, to: deepForest, at: .Right)
    map.add(newNode: marsh1, to: weedyField, at: .Right)
    map.add(newNode: werewolfPark, to: marsh1, at: .Right)
    map.add(newNode: marsh2, to: werewolfPark, at: .Down)
    map.add(newNode: abandonedLot, to: marsh2, at: .Left)
    map.add(newNode: abandonedLot, to: marsh1, at: .Down)
    map.add(newNode: gate, to: abandonedLot, at: .Left)
    map.add(newNode: gate, to: weedyField, at: .Down)
    map.add(newNode: porchOfAShotgunshack, to: gate, at: .Down)
    
    // The following are not added until the player unlocks a door
    
    // map.add(newNode: frontroom, to: porchOfAShotgunshack, at: .Down)
    // map.add(newNode: bedroom, to: frontroom, at: .Left)
    // map.add(newNode: makeshiftBedroom, to: frontroom, at: .Down)
    // map.add(newNode: kitchen, to: makeshiftBedroom, at: .Down)
    // map.add(newNode: bathroom, to: kitchen, at: .Left)
    // map.add(newNode: laundryRoom, to: kitchen, at: .Right)
    // map.add(newNode: basement, to: kitchen, at: .Down)
    // map.add(newNode: secondBasement, to: basement, at: .Down)
    
    return map
}

func generateArea2() -> Graph {
    let map = Graph(startingPoint: cityLimits)
    
    return map
}

func generateArea3() -> Graph {
    let map = Graph(startingPoint: baseOfSpire)
    
    return map
}
