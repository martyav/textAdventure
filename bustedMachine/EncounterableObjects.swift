//
//  EncounterableItems.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let Pipe: Item = Item(name: "PIPE", description: "This is a little aluminum pipe. For tobacco use only?", pocketable: true)
let Lighter: Item = Item(name: "LIGHTER", description: "This is a lighter. It has a colorful illustration of pegasus on it.", pocketable: true)
let Key: Item = Item(name: "KEY", description: "This is a key. It's silvery and has a little dab of red nail polish on it.", pocketable: true)
let ScoobySnacks: Item = Item(name: "BOX", description: "This is a full box of Scooby Snacks. They look tasty.", pocketable: true)
let Baggy: Item = Item(name: "BAGGY", description: "This is a ziplock baggy containing tiny bits of plant material and some dimes.", pocketable: true)

let Weeds: Item = Item(name: "WEEDS", description: "These are weeds. You'd think people would be more careful up here and not bring any weeds or pests with them. You'd be wrong.", pocketable: true, replenishable: true, simpleUse: "You hold the weeds in your fuzzy hand. Thank goodness you don't have any skin, or they'd make you real itchy.")
let Grass: Item = Item(name: "GRASS", description: "This is grass. It's withered and not very smokeable.", pocketable: true, replenishable: true, simpleUse: "You hold the grass in your fuzzy hand. If you were a botanist, you could identify this as ryegrass, a popular, cold-hearty ground cover for lawns and animal grazing.")
let Clover: Item = Item(name: "CLOVER", description: "This is clover. You can tell because all these little plants have four leaves. Wait, isn't that supposed to be rare?", pocketable: true, replenishable: true, simpleUse: "You hold the clover in your fuzzy hand. Like all the other clover plants up here, it's a four-leaf clover.")
let Logs: Item = Item(name: "LOGS", description: "These are some logs. They are dry enough to sit on.", pocketable: false, simpleUse: "You sit on the logs.")
let Trees: Item = Item(name: "TREES", description: "These are trees. They're tall, bare, and covered in black bark.", pocketable: false)
let Fibers: Item = Item(name: "FIBERS", description: "These are fibers. They're moist. They're smelly. They're creeping you out.", pocketable: false)
let TrashCan: Item = Item(name: "CAN", description: "This is a trash can. It's stuffed with all kinds of TRASH. On top is what appears to be a full BOX of dog treats.", pocketable: false, contents: [ScoobySnacks.name: ScoobySnacks, Trash.name: Trash], simpleUse: "You use the trash can to empty out your colostomy bag.")
let Trash: Item = Item(name: "TRASH", description: "This is some trash. Let's see -- an issue of Mad magazine, an old foot, pizza crusts, and a sock...", pocketable: true, replenishable: true, simpleUse: "You sniff the trash. Smells like home.")
let Bags: Item = Item(name: "BAGS", description: "These are dirty plastic bags. They are wet and brittle. Hasn't anyone heard of recycling?", pocketable: true, replenishable: true, contents: [:], simpleUse: "You open up the bag. It's full of holes and quite useless for holding anything.")
let Skins: Item = Item(name: "SKINS", description: "These are shredded vinyl skins. They're very colorful but thinking about where they might have come from is pretty gross.", pocketable: true, replenishable: true, simpleUse: "You hold the skins in your fuzzy hand. These used to belong to somebody. Multiple somebodies, in fact, judging by the different colors!")
let Skin: Item = Item(name: "SKIN", description: "This is an old, ripped-up vinyl skin. Some robot must be walking around butt-naked.", pocketable: true, replenishable: true, simpleUse: "You hold the skin in your fuzzy hand. It's shiny and colorful and dented in places, following the form of the body it once covered.")
let Parts: Item = Item(name: "PARTS", description: "These are busted machine parts. Some of them look like they might have come off of a person, such as a robot, or even a Monster just like yourself.", pocketable: false)
let GuardRail: Item = Item(name: "RAIL", description: "This is a big piece of sheet metal. It houses some eletrical outlets for charging bikes and other small vehicles.", pocketable: false)
let Gate: Item = Item(name: "GATE", description: "This is a chainlink fence gate. It is not especially secure. There's no lock or anything.", pocketable: false)
let Fence: Item = Item(name: "FENCE", description: "This is a chainlink fence. It's almost as tall as you are...which is not very tall.", pocketable: false)
let Tiles: Item = Item(name: "TILES", description: "These are tiles. They are ceramic. Most of the stuff up here is made out of them, when you get down to it.", pocketable: false)
let Fairylights: Building = Building(name: "FAIRYLIGHTS", description: "This is a tangle of fairy lights. No, they're not made of real fairies. They're just a bunch of tiny light bulbs attached to a long wire. They're pretty, though.", allowedIn: false)
let Toilet: Item = Item(name: "TOILET", description: "This is a toilet. It could use an extra flush or two.", pocketable: false, replenishable: false, contents: [:], simpleUse: "You drain your catheter into the toilet.")
let Truck: Vehicle = Vehicle(name: "TRUCK", description: "This is a big truck. It has no driver. There are bright lights along the sides and across the back and grill. It is drafting behind the truck ahead of it.", allowedOn: false)
let Lights: Building = Building(name: "LIGHTS", description: "This is a distant cluster of lights. It's a city, but it's far away. Your family lives there.", allowedIn: false)
let ShotgunShack: Building = Building(name: "SHACK", description: "This is a shotgun shack. The rooms in this building come one after another, back to front. Someone appears to have remodeled it to add extra rooms, though. This sort of home design predates central air and indoor plumbing, so it's rare to see it aboard space stations.", allowedIn: false)
let Spire: Building = Building(name: "SPIRE", description: "This is a very tall spire. It seems to have no end. There are many large vehicles buzzing around it. They come up to the balconies, hover for a while, then fly off.", allowedIn: false)
