//
//  EncounterableItems.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

let Truck: Vehicle = Vehicle(name: "TRUCK", description: "This is a big truck. It has no driver. There are bright lights along the sides and across the back and grill. It is drafting behind the truck ahead of it.", allowedOn: false)
let Pipe: Item = Item(name: "PIPE", description: "This is a little aluminum pipe. For tobacco use only?", pocketable: true)
let Lighter: Item = Item(name: "LIGHTER", description: "This is a lighter. It has a colorful illustration of pegasus on it.", pocketable: true)
let Key: Item = Item(name: "KEY", description: "This is a key. It's silvery and has a little dab of red nail polish on it.", pocketable: true)
let TrashCan: Item = Item(name: "CAN", description: "This is a trash can. It's stuffed with all kinds of trash. On top is what appears to be a full BOX of dog treats.", pocketable: false, contents: [ScoobySnacks.name: ScoobySnacks])
let ScoobySnacks: Item = Item(name: "BOX", description: "This is a full box of Scooby Snacks. They look tasty.", pocketable: true)
let Baggy: Item = Item(name: "BAGGY", description: "This is a ziplock baggy containing tiny bits of plant material and some dimes.", pocketable: true)
