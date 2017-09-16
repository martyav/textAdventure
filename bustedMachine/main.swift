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
print("You can LOOK, TAKE, USE, check for EXITS, check your fanny pack's POCKETS, go LEFT DOWN RIGHT or UP, cry for HELP, or QUIT. \n")

while true {
    print("> ")
    let input = readLine()!.lowercased()
    
    if input == "help" || input == "help!" || input == "help?" {
        print("Here are a list of commands you can do:")
        print("* look -- look around your current location")
        print("* look at ___ -- look at an object, direction, or character")
        print("* exits -- see all the exits")
        print("* left, right, up, or down -- travel in that direction (from a 2D, top-down perspective)")
        print("* take ___ -- put an object inside your fanny pack")
        print("* use ___ -- use an object in your fanny pack")
        print("* what's my ___ -- ask a personal question")
        print("* quit -- quit the game")
        continue
    }
    
    if input == "what am i" || input == "what am i?" {
        player.tellUserYour("kind")
    }
    
    let check = input.components(separatedBy: " ")
    
    let whatsMy = try! NSRegularExpression(pattern: "\\b(what's my)\\b", options: .caseInsensitive)
    let whatsMyMatch = whatsMy.matches(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count))
    
    if !whatsMyMatch.isEmpty {
        let query = check.last!
        
        switch query {
        case "name":
            player.tellUserYour("name")
        case "age":
            print("You recall a late 20th century pop-punk song from that time you had to take Classical Music Appreciation class. The music video they made you watch for it was very strange. Your teacher said it was designed to be comedic. People back had a strange sense of humor.")
        case "species":
            print("That's an ambigious question, and frankly kind of rude.")
        case "race":
            print("That's a rude question.")
        case "class":
            print("You're a humble citizen of the H.S.S. Cloud Mill, sponsored by Dream Makers Absolute Zero Incorporated, Twifoogle & Unilab.")
        case "job":
            print("You're unemployed.")
        case "quest":
            print("You don't have a 'quest'. You think that calling whatever your goal in life is your quest is actually kind of pretentious.")
        case "goal":
            print("You don't have any overarching goals. You like having fun, meeting people, smoking your pipe, exploring...")
        case "deal":
            print("You're kind of bored and lonely. It's tough being a monster sometimes. A lot of people think you're creepy just for existing. Others don't take you seriously, based purely on your appearance. Maybe the fanny pack and boxers don't help, but if they're going to think that anyway, why bother fitting in?")
        case "gender":
            print("You're still sorting that out, but you generally go by \(player.pronouns.joined(separator: "/")) pronouns when out in public.")
        case "location":
            print("You are here: \(player.here.location)")
        case "status":
            print("Single.")
        case "sex":
            print("You're still a virgin.")
        default:
            print("That's a weird question.")
        }
    }
    
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
    
    let use = try! NSRegularExpression(pattern: "\\b(use)\\b", options: .caseInsensitive)
    let useMatch = use.matches(in: input, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, input.characters.count))
    
    if !useMatch.isEmpty {
        let item = check.last!
        
        switch item {
        case "pipe":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                print("You put the stuff inside the BAGGY in your PIPE and light it with your LIGHTER.")
                continue
            }
            
            if player.pockets["PIPE"] != nil {
                print("You put the PIPE in your mouth. It's empty. You look kind of silly.")
            } else {
                print("What \(item)? You don't have a \(item).")
            }
        case "lighter":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                print("You put the stuff inside the BAGGY in your PIPE and light it with your LIGHTER.")
                continue
            }
            
            if player.pockets["LIGHTER"] != nil {
                print("You flick the LIGHTER on. Ooh, pretty.")
            } else {
                print("What \(item)? You don't have a \(item).")
            }
        case "key":
            if player.pockets["KEY"] != nil {
                print("You try to use the KEY to unlock thin air.")
            } else {
                print("What \(item)? You don't have a \(item).")
            }
        case "scoobysnacks", "snacks", "treats", "dogtreats", "box":
            if player.pockets["BOX"] != nil {
                print("You eat a Scooby Snack. Yum!")
            } else {
                print("What \(item)? You don't have a \(item).")
            }
        case "baggy", "baggie", "bag":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                print("You put the stuff inside the BAGGY in your PIPE and smoke it.")
                continue
            }
            
            if player.pockets["BAGGY"] != nil {
                print("You open up the BAGGY and sniff it. It's stinky.")
            } else {
                print("What \(item)? You don't have a \(item).")
            }
        default:
            print("You can't do that!")
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
        case "scoobysnacks", "snacks", "treats", "dogtreats", "box":
            if let hasTreats = player.pockets["treats"] {
                hasTreats.printName()
                hasTreats.printDescription()
            }
        case "baggy", "baggie", "bag":
            if let hasBaggy = player.pockets["baggy"] {
                hasBaggy.printName()
                hasBaggy.printDescription()
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
            print("Bye, \(player.name)!")
            exit(0)
        default:
            print("I don't understand.")
        }
    }
}
