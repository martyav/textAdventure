//
//  EncounterableItems.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let Pipe: Item = Item(name: "PIPE", description: "This is a little aluminum pipe. For tobacco use only?", pocketable: true, simpleUse: "You put the PIPE in your mouth. It's empty. You look kind of silly.")
let Lighter: Item = Item(name: "LIGHTER", description: "This is a lighter. It has a colorful illustration of pegasus on it.", pocketable: true, simpleUse: "You flick the LIGHTER on. Ooh, pretty.")
let Key: Item = Item(name: "KEY", description: "This is a key. It's silvery and has a little dab of red nail polish on it.", pocketable: true, simpleUse: "You try to use the KEY to unlock thin air.")
let ScoobySnacks: Item = Item(name: "BOX", description: "This is a full box of Scooby Snacks. They look tasty.", pocketable: true, simpleUse: "You eat a Scooby Snack. Yum!")
let Baggy: Item = Item(name: "BAGGY", description: "This is a ziplock baggy containing tiny bits of plant material and some dimes.", pocketable: true, simpleUse: "You open up the BAGGY and sniff it. It's stinky.")

let Weeds: Item = Item(name: "WEEDS", description: "These are weeds. You'd think people would be more careful up here and not bring any weeds or pests with them. You'd be wrong.", pocketable: true, replenishable: true, simpleUse: "You hold the weeds in your fuzzy hand. Thank goodness you don't have any skin, or they'd make you real itchy.")
let Grass: Item = Item(name: "GRASS", description: "This is grass. It's withered and not very smokeable.", pocketable: true, replenishable: true, simpleUse: "You hold the grass in your fuzzy hand. If you were a botanist, you would identify this as ryegrass, a popular, cold-hardy ground cover for lawns and animal grazing. But you're not, so you try to eat it.")
let Clover: Item = Item(name: "CLOVER", description: "This is clover. You can tell because all these little plants have four lea -- Wait, aren't four-leaf clovers supposed to be rare?", pocketable: true, replenishable: true, simpleUse: "You rub the clover for luck. Like all the other clover plants up here, it's a four-leaf clover.")
let Logs: Item = Item(name: "LOGS", description: "These are some logs. They are dry enough to sit on.", pocketable: false, simpleUse: "You sit on the logs.")
let Trees: Item = Item(name: "TREES", description: "These are trees. They're tall, bare, and covered in black bark.", pocketable: false)
let Fibers: Item = Item(name: "FIBERS", description: "These are fibers. They're moist. They're smelly. They're creeping you out.", pocketable: false)
let TrashCan: Item = Item(name: "CAN", description: "This is a trash can. It's stuffed with all kinds of TRASH. On top is what appears to be a full BOX of dog treats.", pocketable: false, contents: [ScoobySnacks.name: ScoobySnacks, Trash.name: Trash], simpleUse: "You use the trash can to empty out your colostomy bag.")
let Trash: Item = Item(name: "TRASH", description: "This is some trash. Let's see -- an issue of Mad magazine, an old foot, pizza crusts, vinyl SKINS, tissues, newspapers, and a sock...", pocketable: true, replenishable: true, contents: [Skins.name: Skins], simpleUse: "You sniff the trash. Smells like home.")
let Bags: Item = Item(name: "BAGS", description: "These are dirty plastic bags. They are wet and brittle. Hasn't anyone heard of recycling?", pocketable: true, replenishable: true, contents: [:], simpleUse: "You open up the bag. It's full of holes and quite useless for holding anything.")
let Skins: Item = Item(name: "SKINS", description: "These are shredded vinyl skins. They're very colorful but thinking about where they might have come from is pretty gross.", pocketable: true, replenishable: true, simpleUse: "You hold the skins in your fuzzy hand. These used to belong to somebody. Multiple somebodies, in fact, judging by the different colors!")
let Skin: Item = Item(name: "SKIN", description: "This is an old, ripped-up vinyl skin. Some robot must be walking around butt-naked.", pocketable: true, replenishable: true, simpleUse: "You hold the skin in your fuzzy hand. It's shiny and colorful and dented in places, following the form of the body it once covered.")
let Parts: Item = Item(name: "PARTS", description: "These are busted machine parts. Some of them look like they might have come off of a person, such as a robot, or even a Monster just like yourself.", pocketable: false)
let GuardRail: Item = Item(name: "RAIL", description: "This is a big piece of sheet metal. It houses some electrical outlets for charging bikes and other small vehicles.", pocketable: false)
let Gate: Item = Item(name: "GATE", description: "This is a chainlink fence gate. There's no lock on it. In fact, you could probably climb over it.", pocketable: false, simpleUse: "You open and close the gate. Though, frankly, it's kind of pointless, since you can just hop over it and walk right through.")
let Fence: Item = Item(name: "FENCE", description: "This is a chainlink fence. It's almost as tall as you are...which is not very tall.", pocketable: false)
let Tiles: Item = Item(name: "TILES", description: "These are ceramic tiles. Most of the stuff up here is made out of them, when you get down to it.", pocketable: false)
let Lock: Item = Item(name: "LOCK", description: "This is a lock. It is dabbed with red nail polish.", pocketable: false)
let Drawing: Item = Item(name: "DRAWING", description: "This is a drawing of a blue Monster with yellow horns and purple spots.", pocketable: false)
let Table: Item = Item(name: "TABLE", description: "This is a table. It looks like somebody dragged it off of a street corner somewhere.", pocketable: false, simpleUse: "You try to stand on the table. You're short so it's kind of a gymnastic maneuver to get on top.")
let Sofa: Item = Item(name: "SOFA", description: "This is a sofa made out of a synthetic material called Naugahyde. Folks used to joke that Naugahyde was made out of the hide of a fictional animal. Nowadays, such a joke would be in bad taste. Many people now have skin made out of synthetic materials.", pocketable: false, simpleUse: "You sit on the Naugahyde sofa. It's kind of like sitting on a giant robot.")
let Chair: Item = Item(name: "CHAIR", description: "This is a chair. It has all of the qualities you would expect from a chair: legs, a seat, arm rests...the only strange thing about it is that it's one of those folding beach chairs people use to sunbathe, but it's inside a house.", pocketable: false, simpleUse: "You sit on the chair.")
let Cabinet: Item = Item(name: "CABINET", description: "This is a metal cabinet. It has a bunch of open shelves, and some holes in the back for wires to dangle out of.", pocketable: false, contents: [CRT.name: CRT], simpleUse: "You open up the cabinet. The inner shelves have some curse words written on them. You avert your delicate googly eyes.")
let Napkins: Item = Item(name: "NAPKINS", description: "These are torn napkins. You suspect that somebody was ripping them up to smoke out of them.", pocketable: true, replenishable: true, simpleUse: "You wipe your fuzzy hands on the napkins.")
let Drawers: Item = Item(name: "DRAWERS", description: "This is a chest of drawers. It looks like it might have been dragged out of a pile of TRASH.", pocketable: false, contents: [Trash.name: Trash])
let CRT: Item = Item(name: "CRT", description: "This is a CRT video thingamajig. CRT stands for cathode ray tube. It's a big, heavy box with a curved glass screen on the front, and a lot of outlets and wires coming out of the back.", pocketable: false, simpleUse: "You turn the CRT on and off. Somebody was watching an old cartoon about talking mice.")
let Mattress: Item = Item(name: "MATTRESS", description: "This is a big mattress. It has an interesting smell.", pocketable: false)
let Ashtray: Item = Item(name: "ASHTRAY", description: "This is an ashtray. It's covered in a thin layer of ash. The bottom has the logo for Twifoogle inscribed.", pocketable: false, simpleUse: "You try to lick the ashtray.")
let Fairylights: Item = Item(name: "FAIRYLIGHTS", description: "This is a tangle of fairy lights. No, they're not made of real fairies. They're just a bunch of tiny light bulbs attached to a long wire. They're pretty, though.", pocketable: false, simpleUse: "You turn the lights on and off.")
let Cabinets: Item = Item(name: "CABINETS", description: "These are kitchen cabinets. They're mostly empty, except for some TRASH.", pocketable: false, contents: [Trash.name: Trash], simpleUse: "You look through the cabinets. Don't these folks own any spices?")
let Hole: Item = Item(name: "HOLE", description: "This is a gaping hole in the floor", pocketable: false, simpleUse: "You fall through the floor and die.")
let Sink: Item = Item(name: "SINK", description: "This is a sink. Clean water comes out of the faucets. At least, it's supposed to be clean.", pocketable: false, simpleUse: "You try the faucet, but the water doesn't work.")
let Refrigerator: Item = Item(name: "REFRIGERATOR", description: "This is a refrigerator. It has a bunch of curse words written on it.", pocketable: false, simpleUse: "You open the fridge. It's completely empty and smells very bad.")
let Toilet: Item = Item(name: "TOILET", description: "This is a toilet. It could use an extra flush or two.", pocketable: false, replenishable: false, contents: [:], simpleUse: "You drain your catheter into the toilet.")
let Machines: Item = Item(name: "MACHINES", description: "These aren't robot friends. It's a washer and a dryer.", pocketable: false)
let Boxes: Item = Item(name: "BOXES", description: "These are boxes full of colorful powders. They smell like soap.", pocketable: false)
let Bottles: Item = Item(name: "BOTTLES", description: "These are bottles full of colorful liquids. They smell like soap.", pocketable: false)
let Graffiti: Item = Item(name: "GRAFFITI", description: "This is some impressive graffiti.", pocketable: false)
let Poster: Item = Item(name: "POSTER", description: "This is a poster advertising a sci-fi movie. It's set aboard a space station. People back then had a lot of weird ideas about what living in space would be like.", pocketable: false)
let Truck: Vehicle = Vehicle(name: "TRUCK", description: "This is a big truck. It has no driver. There are bright lights along the sides and across the back and grill. It is drafting behind the truck ahead of it.", allowedOn: false)
let Lights: Building = Building(name: "LIGHTS", description: "This is a distant cluster of lights. It's a city, but it's far away. Your family lives there.", allowedIn: false)
var ShotgunShack: Building = Building(name: "SHACK", description: "This is a shotgun shack. The rooms in this building come one after another, back to front. Someone appears to have remodeled it to add extra rooms, though. The door has a LOCK.", allowedIn: false)
let Spire: Building = Building(name: "SPIRE", description: "This is a very tall spire. It seems to have no end. There are many large vehicles buzzing around it. They come up to the balconies, hover for a while, then fly off.", allowedIn: false)
