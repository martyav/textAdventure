//
//  GameMap.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let weedyField = Node(location: "Weedy Field", description: "You are standing in a weedy field. The grass comes up to your ankles. It grows in irregular tufts, interrupted here and there by clover.")
let nearHighway = Node(location: "Near Highway", description: "You are standing on the shoulder of an enormous highway. It's very empty and very quiet. Occassionally, huge trucks flash by in twinkling single-file.")
let farHighway = Node(location: "Far Highway", description: "You are standing on the shoulder of an enormous highway. It goes on and on, in a long curve, toward a cluster of lights.")
let fartherHighway = Node(location: "Farther Highway", description: "You are standing on the shoulder of an enormous highway. It goes on and on, in a long curve, toward a cluster of lights.")
let forest = Node(location: "Forest", description: "You are at the edge of a deep forest. The trees are black and bare. Grass and clover grow in erratic patterns. Scattered about are filthy plastic bags, crumpled vinyl skins, and jagged machine parts.")
let deepForest = Node(location: "Deep Forest", description: "You are standing in a deep forest. It's difficut to move because you are almost completely surrounded by tall weeds, ragged pieces of trash, and skinny black tree trunks. Your fuzz is getting snagged on everything.")
let clearing = Node(location: "Clearing", description: "You are standing in a strange clearing. Dense trees surround it on all sides. The ground drops down abruptly. The soil has been washed away, revealing beige tiles covered in a loose tangle of off-white fibers. A thin layer of water coats everything.")
let marsh1 = Node(location: "Marsh 1", description: "You are standing in a squishy field. The ground is very wet and spongy. Shiny strips of vinyl skin are scattered around, hanging from tall weeds and broken black trees.")
let werewolfPark = Node(location: "Werewolf Park", description: "You are standing in a mucky forest. Bare black trees grow in loose arrangements. The ground is covered in tall grass, clover, and scratchy weeds. There are also many recently felled trees. They provide dry footing and a place to sit.")
let marsh2 = Node(location: "Marsh 2", description: "You are standing in a squishy field. The ground is very wet and spongy. Shiny strips of vinyl skin are scattered around, hanging from tall weeds and broken black trees.")
let abandonedLot = Node(location: "Abandoned Lot", description: "You are standing in an abandoned lot. The ground is made up of beige tiles. There are outlets for charging electric bikes along a low guard rail. An overflowing trash can stands near the gate.")
let gate = Node(location: "Gate", description: "You stand before a low chain link fence. One side is reinforced by a long metal guard rail with wires coming out of it. The only way in is through a crumpled gate.")
let shotgunShack = Node(location: "Shotgun Shack", description: "You find yourself standing in front of a shotgun shack. It looks very weathered. Someone has spraypainted the words 'Monster Party' and a crude drawing of a googly-eyed monster across the front porch.")
let frontroom = Node(location: "Front Room", description: "You find yourself inside a shotgun shack. The front room is vividly painted orange and green. You see a Naugahyde sofa, a wooden coffee table, a plastic beach chair, and a metal TV cabinet with a CRT monitor inside.")
let bedroom = Node(location: "Bedroom", description: "You find yourself inside a shotgun shack. This narrow room is dominated by a Queen-size mattress that lies flat on the floor. A tangle of twinkling lights covers the ceiling. On the mattress is an ashtray and some napkins.")
let makeshiftBedroom = Node(location: "Makeshift Bedroom", description: "You find yourself inside a shotgun shack. This is a hallway that is also a bedroom. There is an empty bed frame and a chest of drawers. Rubble is piled by the back wall.")
let kitchen = Node(location: "Kitchen", description: "You find yourself inside a shotgun shack. This kitchen is vividly painted green and orange. Someone has spraypainted 'Humans suck!' on the wall. There is a round formica table, a refrigerator, and many open cabinets. There is a big hole in the floor by the sink.")
let bathroom = Node(location: "Bathroom", description: "You find yourself inside a shotgun shack. This is a bathroom. It is so small, you can wash your hands while still sitting on the toilet. All the walls are covered in grafitti. The mirror above the sink is smashed.")
let laundryRoom = Node(location: "Laundry Room", description: "You find yourself inside a shotgun shack. This is a smelly, humid room made up of bare beige tiles. Pipes and wires connect to a pair of large white machines. Next to the machines are some plastic bottles and cardboard boxes.")
let basement = Node(location: "Basement", description: "You find yourself inside a shotgun shack. Down a creaky set of stairs is a musty room made up of beige tiles. Wood paneling is glued halfway up the walls. There is a poster of movie about an astronaut.")
let secondBasement = Node(location: "Second Basement", description: "You find yourself inside a shotgun shack. Down another set of creaky stairs is the second basement. It is as big as the house is long. The floor is spread with shag carpeting. Colorful graffiti and stickers cover the beige tile walls.")

let map = Graph(startingPoint: weedyField)

func generateGameWorld() {
    map.add(newNode: nearHighway, to: weedyField, at: .Left)
    map.add(newNode: farHighway, to: nearHighway, at: .Up)
    map.add(newNode: fartherHighway, to: farHighway, at: .Up)
    map.add(newNode: fartherHighway, to: fartherHighway, at: .Up)
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
    map.add(newNode: shotgunShack, to: gate, at: .Down)
    map.add(newNode: frontroom, to: shotgunShack, at: .Down)
    map.add(newNode: bedroom, to: frontroom, at: .Left)
    map.add(newNode: makeshiftBedroom, to: frontroom, at: .Down)
    map.add(newNode: kitchen, to: makeshiftBedroom, at: .Down)
    map.add(newNode: bathroom, to: kitchen, at: .Left)
    map.add(newNode: laundryRoom, to: kitchen, at: .Right)
    map.add(newNode: basement, to: kitchen, at: .Down)
    map.add(newNode: secondBasement, to: basement, at: .Down)
}
