//
//  main.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

generateGameWorld()

print("Hello. What is your name?")
print("> ")
let name = readLine()!.capitalized
print("And what pronouns would you like? For example -- (1) she/her/hers, (2) he/him/his, (3) they/them/their")
var pronouns = readLine()!
if let response = Int(pronouns) {
    switch response {
    case 1:
        pronouns = "she/her/hers"
    case 2:
        pronouns = "he/him/his"
    case 3:
        pronouns = "they/them/their"
    default:
        break
    }
}

let player = Player(name: name, pronouns: pronouns, kind: .Monster, appearance: "You have a short, rubbery snout, ending in a bright blue nose. Your hands have four fingers, and your feet have two toes. Your pointy ears swivel in the direction of sound. You are about 1.5 meters tall, all about. Tl;dr -- you are a fuzzy red monster-thing with big googly eyes. You're wearing a bandana around your neck, a fanny pack around your waist, a pair of gym socks, a pair of tennis shoes, and a pair of boxer shorts.", location: map.startingPoint, pockets: [Pipe.name: Pipe, Lighter.name: Lighter, Key.name: Key])

print("Hi, \(player.name)! \n")
player.tellUserYour("kind")
print("")
player.tellUserYour("appearance")
print("")
player.tellUserYour("inventory")
print("")
player.look()
print("")
print("You can LOOK, check for EXITS, check your POCKETS, go LEFT DOWN RIGHT or UP, or QUIT. \n")

while true {
    print("> ")
    let input = readLine()!.lowercased()
    
    let check = input.components(separatedBy: " ")
    
    let take = try! NSRegularExpression(pattern: "\\b(take)\\b", options: .caseInsensitive)
    let takeMatch = take.matches(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count))
    
    if !takeMatch.isEmpty {
        let object = check.last!
        
        if !player.here.objects.isEmpty {
            if let hasObject = player.here.objects[object.uppercased()] {
                if hasObject.isPocketable() {
                    player.take(hasObject as! Item)
                    player.here.objects[object] = nil
                    print("You take the \(object).")
                } else {
                    print("You can't take that!")
                }
            }
        }
    }
    
    let lookAt = try! NSRegularExpression(pattern: "\\b(look at)\\b", options: .caseInsensitive)
    let lookAtMatch = lookAt.matches(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count))
    
    if !lookAtMatch.isEmpty {
        let object = check.last!
        
        if !player.here.objects.isEmpty {
            if let hasObject = player.here.objects[object.uppercased()] {
                hasObject.printDescription()
                if let item = hasObject as? Item {
                    if !item.contents.isEmpty {
                        for (key, value) in item.contents {
                            player.here.objects[key] = value
                        }
                    }
                }
                continue
            }
            continue
        }
        
        switch object {
        case "pockets":
            player.tellUserYour("inventory")
        case "yourself", "mirror", "reflection":
            player.tellUserYour("name")
            player.tellUserYour("description")
        case player.here.location, "around":
            player.look()
        case "left":
            if let left = player.here.pathsOut.left {
                print("You see a \(left.location).")
                continue
            } else {
                print("You see a deadend")
            }
        case "down":
            if let down = player.here.pathsOut.down {
                print("You see a \(down.location).")
                continue
            } else {
                print("You see a deadend")
            }
        case "right":
            if let right = player.here.pathsOut.right {
                print("You see a \(right.location).")
                continue
            } else {
                print("You see a deadend")
            }
        case "up":
            if let up = player.here.pathsOut.up {
                print("You see a \(up.location).")
                continue
            } else {
                print("You see a deadend")
            }
        case "pipe":
            if let hasPipe = player.pockets["pipe"] {
                hasPipe.printName()
                hasPipe.printDescription()
            }
        case "lighter":
            if let hasLighter = player.pockets["lighter"] {
                hasLighter.printName()
                hasLighter.printDescription()
            }
        case "key":
            if let hasKey = player.pockets["pipe"] {
                hasKey.printName()
                hasKey.printDescription()
            }
        case "scoobysnacks", "snacks", "treats", "dog treats":
            if let hasTreats = player.pockets["treats"] {
                hasTreats.printName()
                hasTreats.printDescription()
            }
        default:
            print("You can't look at that.")
        }
        
        continue
    }
    
    if input.contains("left") && !input.contains("look") {
        player.travel(to: .Left)
        continue
    } else if input.contains("down") && !input.contains("look") {
        player.travel(to: .Down)
        continue
    } else if input.contains("right") && !input.contains("look") {
        player.travel(to: .Right)
        continue
    } else if input.contains("up") && !input.contains("look") {
        player.travel(to: .Up)
        continue
    }
    
    if input.contains("left") && input.contains("look") {
        if let left = player.here.pathsOut.left {
            print("You see a \(left.location).")
            continue
        } else {
            print("You see a deadend")
        }
        continue
    } else if input.contains("down") && input.contains("look") {
        if let down = player.here.pathsOut.down {
            print("You see a \(down.location).")
            continue
        } else {
            print("You see a deadend")
        }
        continue
    } else if input.contains("right") && input.contains("look") {
        if let right = player.here.pathsOut.right {
            print("You see a \(right.location).")
            continue
        } else {
            print("You see a deadend")
        }
        continue
    } else if input.contains("up") && input.contains("look") {
        if let up = player.here.pathsOut.up {
            print("You see a \(up.location).")
            continue
        } else {
            print("You see a deadend")
        }
        continue
    }
    
    if check.count == 1 {
        
        switch input {
        case "look":
            player.look()
        case "exits":
            player.checkForExits()
        case "pockets":
            player.tellUserYour("inventory")
        case "quit":
            exit(0)
        default:
            print("I don't understand.")
        }
    }
}
