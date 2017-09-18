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


let Grass: Item = Item(name: "GRASS", description: "This is grass. It's yellow and not very smokeable.", pocketable: false)
let Clover: Item = Item(name: "CLOVER", description: "This is clover. You can tell because all these little plants have four leaves. Wait, isn't that supposed to be rare?", pocketable: false)
let Logs: Item = Item(name: "LOGS", description: "These are some logs. They are dry enough to sit on.", pocketable: false)
let Trees: Items = Item(name: "TREES", description: "These are trees. They're tall, bare, and covered in black bark.", pocketable: false)
let Fibers: Item = Item(name: "FIBERS", description: "These are fibers. They're moist. They're smelly. They're creeping you out.", pocketable: false)
let TrashCan: Item = Item(name: "CAN", description: "This is a trash can. It's stuffed with all kinds of trash. On top is what appears to be a full BOX of dog treats.", pocketable: false, contents: [ScoobySnacks.name: ScoobySnacks])
let GuardRail: Item = Item(name: "RAIL", description: "This is a big piece of sheet metal. It houses some eletrical outlets for charging bikes and other small vehicles.", pocketable: false)
let Truck: Vehicle = Vehicle(name: "TRUCK", description: "This is a big truck. It has no driver. There are bright lights along the sides and across the back and grill. It is drafting behind the truck ahead of it.", allowedOn: false)
let Lights: Building = Building(name: "LIGHTS", description: "This is a distant cluster of lights. It's a city, but it's far away. Your family lives there.", allowedIn: false)
let ShotgunShack: Building = Building(name: "SHACK", description: "This is a shotgun shack. The rooms in this building come one after another, back to front. Someone appears to have remodeled it to add extra rooms, though. This sort of home design predates central air and indoor plumbing, so it's rare to see it aboard space stations.", allowedIn: false)
let Spire: Building = Building(name: "SPIRE", description: "This is a very tall spire. It seems to have no end. There are many large vehicles buzzing around it. They come up to the balconies, hover for a while, then fly off.", allowedIn: false)
