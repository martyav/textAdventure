//
//  InstructionManual.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/25/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

protocol InstructionManual {
    var keywords: [String] { get }
    var synonymsForTravel: [String] { get }
    
    func whatsMy(_ word: String) -> String
    func look(at thing: String) -> String
    func travel(_ direction: String) -> String
    func use(_ item: String) -> String
    func drop(_ object: String) -> String
    func take(_ object: String) -> String
    func pockets() -> String
    func change(_ input: String) -> String
    func exits() -> String
    func help() -> String
    func say(_ input: String) -> String
    func existentialism() -> String
}

class BasicInstructions: InstructionManual {
    let player: Player
    var area: Graph
    
    init(player: Player, area: Graph) {
        self.player = player
        self.area = area
    }
    
    let keywords = [
        "repeat"
        ,"take"
        , "drop"
        , "look"
        , "help"
        , "exits"
        , "exist"
        , "pockets"
        , "use"
        , "what's"
        , "what"
        , "where"
        , "who"
        , "change"
        , "say"
        , "left"
        , "down"
        , "right"
        , "up"
        , "quit"
    ]
    
    let synonymsForTravel = [
        "go"
        , "head"
        , "walk"
        , "run"
        , "skip"
        , "jump"
        , "dance"
        , "amble"
        , "climb"
        , "jog"
        , "hop"
        , "sneak"
        , "strafe"
        , "travel"
        , "stomp"
    ]
    
    func say(_ input: String) -> String {
        return "You say, \"\(input)\"."
    }
    
    func help() -> String {
        return "Here is a list of some commands you can use: \n * look -- look around your current location\n * look at ___ -- look at an object, direction, or character\n * left, right, up, or down -- travel in that direction (from a 2D, top-down perspective)\n * exits -- see all the exits\n * pockets -- check your fanny pack's pockets\n * take ___ -- put an object inside your fanny pack\n * use ___ -- use an object\n * say -- speak out loud\n * what's my ___ -- ask a personal question\n * repeat -- repeat the last command\n * quit -- quit the game"
    }
    
    func exits() -> String {
        let name = player.here.location
        
        if let found = area.allNames[name] {
            let placeholder = "deadend"
            
            // centering text
            
            let middleRowCount = ("(found.pathsOut.left?.location ?? placeholder) + RIGHT: \(found.pathsOut.right?.location ?? placeholder)".characters.count)/2
            let topRowCount = "UP: \(found.pathsOut.up?.location ?? placeholder)".characters.count
            let bottomRowCount = "DOWN: \(found.pathsOut.down?.location ?? placeholder)".characters.count
            let topPosition = (middleRowCount/2)  - (topRowCount/2)
            let bottomPosition = (middleRowCount/2) - (bottomRowCount/2)
            let topSpaces = String(repeating: " ", count: topPosition)
            let bottomSpaces = String(repeating: " ", count: bottomPosition)
            
            return "You check for exits:\n\n\(topSpaces)UP: \(found.pathsOut.up?.location ?? placeholder)\nLEFT: \(found.pathsOut.left?.location ?? placeholder) + RIGHT: \(found.pathsOut.right?.location ?? placeholder)\n\(bottomSpaces)DOWN: \(found.pathsOut.down?.location ?? placeholder)"
        }
        
        return "We can't find \(name) on the map."
    }
    
    func change(_ input: String) -> String {
        switch input {
        case "name":
            player.changeName()
            return "Your name is now \(player.name)."
        case "pronouns":
            player.changePronouns()
            return "Your pronouns are now \(player.pronouns.joined(separator: "/"))."
        case "kind":
            return "You can go from being something else to being a Monster, but it's a one-way trip."
        default:
            return "Some things can't be changed. Like that, for instance."
        }
        
    }
    
    func pockets() -> String {
        var buildString: [String] = []
        
        buildString.append("You have")
        
        guard player.pockets.count > 1 else {
            if let oneItem = player.pockets.first {
                buildString.append("a \(oneItem.key) in your fanny pack.")
            } else {
                buildString.append("nothing in your fanny pack.")
            }
            
            return buildString.joined(separator: " ")
        }
        
        for (index, object) in player.pockets.enumerated() {
            if index == player.pockets.count - 1 {
                buildString.append("and a \(object.key)")
            } else {
                buildString.append("a \(object.key),")
            }
        }
        
        buildString.append("in your fanny pack.")
        
        return buildString.joined(separator: " ")
    }
    
    func travel(_ direction: String) -> String {
        let error = "You can't go there!"
        
        if player.here == gate && direction == "gate" {
            return travel("down")
        }
        
        if let moved = player.travel(direction: direction) {
            player.here = moved
        } else {
            return error
        }
        
        return "You go \(direction.uppercased()).\n\(player.here.description)"
    }
    
    func take(_ object: String) -> String {
        if !player.here.objects.isEmpty {
            guard let hasObject = player.here.objects[object.uppercased()] else { return "Take what?" }
            
            guard let item = hasObject as? Item else { return "You can't fit that in a fanny pack!" }
            
            if !item.isPocketable() { return "You can't take that!" } else {
                player.take(item)
                
                guard player.pockets[item.name] != nil else { return "Your fanny pack is full! You have to DROP something."}
                
                if object.characters.last == "s" {
                    return "You take the \(object) and put them in your fanny pack."
                } else {
                    return "You take the \(object) and put it in your fanny pack."
                }
            }
        }
        
        return "There's nothing to take here."
    }
    
    func drop(_ object: String) -> String {
        if let hasObject = player.pockets[object.uppercased()] {
            player.drop(hasObject)
            return "You drop the \(object) on the ground. If you want it back, you'll have to remember to come back here and TAKE it."
        }
        
        return "How can you drop something you don't even have?"
    }
    
    func look(at thing: String) -> String {
        if let found = area.allNames[thing] {
            return found.description
        }
        
        if let found = player.here.npcs[thing.capitalized] {
            return found.appearance
        }
        
        if let found = player.here.objects[thing.uppercased()] {
            if let foundItem = found as? Item {
                if !foundItem.contents.isEmpty {
                    for (key, value) in foundItem.contents {
                        player.here.objects[key] = value
                    }
                }
            }
            return found.description
        }
        
        if let found = player.pockets[thing.uppercased()] {
            return found.description
        }
        
        switch thing {
        case "yourself", "mirror", "reflection", "you", "me", "myself":
            return player.appearance
        case "around":
            return player.here.description
        case "left":
            if let left = player.here.pathsOut.left {
                return "You look \(thing) and see a \(left.location)."
            } else {
                return "You look \(thing) and see a deadend."
            }
        case "down":
            if let down = player.here.pathsOut.down {
                return "You look \(thing) and see a \(down.location)."
            } else {
                return "You look \(thing) and see a deadend."
            }
        case "right":
            if let right = player.here.pathsOut.right {
                return "You look \(thing) and see a \(right.location)."
            } else {
                return "You look \(thing) and see a deadend."
            }
        case "up":
            if let up = player.here.pathsOut.up {
                return "You look \(thing) and see a \(up.location)."
            } else {
                return "You look \(thing) and see a deadend."
            }
        case "pockets":
            return pockets()
        default:
            return "We can't see anything."
        }
    }
    
    func use(_ item: String) -> String {
        let error = "Use what for what now?"
        
        if let heldItem = player.pockets[item.uppercased()] {
            return heldItem.simpleUse
        } else {
            return error
        }
    }
    
    func whatsMy(_ query: String) -> String {
        switch query {
        case "name":
            return "Your name is \(player.name)."
        case "location":
            return "You are here: \(player.here.location)"
        default:
            return "That's a weird question."
        }
    }
    
    func existentialism() -> String {
        
        return "Your name is \(player.name) and you are a \(player.kind).\n\n\(player.appearance)"
    }
}

class Area1: BasicInstructions {
    override func take(_ object: String) -> String {
        if !player.here.objects.isEmpty {
            guard let hasObject = player.here.objects[object.uppercased()] else { return "Take what?" }
            
            guard let item = hasObject as? Item else { return "You can't fit that in a fanny pack!" }
            
            guard item.isPocketable() else { return "You can't take that!" }
            
            player.take(item)
                
            guard player.pockets[item.name] != nil else { return "Your fanny pack is full! You have to DROP something."}
                
            if object.characters.last == "s" {
                guard object != "grass" else {
                    return "You take the \(object) and put them in your fanny pack."
                }
                    
                return "You take the \(object) and put it in your fanny pack."
            }
        }
        return "There's nothing to take here."
    }
    
    override func use(_ item: String) -> String {
        let error = "Use what for what now?"
        
        func justUse(it item: String) -> String {
            if let heldItem = player.pockets[item.uppercased()] {
                return heldItem.simpleUse
            }
            
            if let foundItem = player.here.objects[item.uppercased()] as? Item {
                if foundItem.name == "HOLE" {
                    // if the player tries to use the hole they die
                    print(foundItem.simpleUse)
                    print("Bye, \(player.name)!")
                    exit(0)
                }
                
                if foundItem.name == "LOGS" {
                    if let encounter = player.here.npcs[Werewolf.name] {
                        print(foundItem.simpleUse)
                        if player.here.description != "You are standing in a mucky forest. Bare black TREES grow in loose arrangements. A werewolf named \(encounter.name) is sitting on some LOGS." {
                            player.here.description = "You are standing in a mucky forest. Bare black TREES grow in loose arrangements. A werewolf named \(encounter.name) is sitting on some LOGS."
                            
                            return "\(encounter.name) emerges from the trees. \(encounter.pronouns[0].capitalized) sits down and says, 'Hi'."
                        } else {
                            return "\(encounter.name) smiles shyly and says, \"I'm hungry\"."
                        }
                    } else {
                        return foundItem.simpleUse
                    }
                }
                
                return foundItem.simpleUse
            }
            
            return error
        }
        
        switch item {
        case "box", "treats", "dogtreats", "snacks", "scoobysnacks":
            if player.here == werewolfPark && werewolfPark.description == "You are standing in a mucky forest. Bare black TREES grow in loose arrangements. A werewolf named \(Werewolf.name) is sitting on some LOGS." {
                print("\(Werewolf.name) asks if \(Werewolf.pronouns[0]) can have a Scooby Snack.")
                print(">")
                let response = readLine()!
                let yesOrNo = response.components(separatedBy: " ").last
                if yesOrNo == "yes" || yesOrNo == "yeah" || yesOrNo == "yep" || yesOrNo == "sure" || yesOrNo == "certainly" {
                    print("The werewolf puts the Scooby Snack in \(Werewolf.pronouns[2]) pipe and smokes it. \(Werewolf.pronouns[0]) is so delighted that \(Werewolf.pronouns[0]) gives you \(Werewolf.pronouns[2]) LIGHTER to keep.")
                    player.here.objects[Lighter.name] = Lighter
                    return take("lighter")
                } else if yesOrNo == "no" || yesOrNo == "nope" || yesOrNo == "nah" || yesOrNo == "away" || yesOrNo == "off" {
                    return "\(Werewolf.name) seems dejected."
                } else {
                    return "\(Werewolf.name) tilts \(Werewolf.pronouns[2]) head curiously and says, \"Mrr?\"."
                }
            }
            
            return justUse(it: item)
        case "pipe":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE and light it with your LIGHTER."
            } else if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil {
                return "You hold the LIGHTER up to the PIPE. It gets hot, but the PIPE is still empty."
            } else if player.pockets["PIPE"] != nil && player.pockets["BAGGY"] != nil {
                return "You take some of the stuff inside the BAGGY and put it in your PIPE. But you have no way to light it."
            }
            
            return justUse(it: item)
        case "lighter":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE and light it with your LIGHTER."
            } else if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil {
                return "You hold the LIGHTER up to the PIPE. It gets hot, but the PIPE is still empty."
            } else if player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You try to use the LIGHTER on the contents of the BAGGY. The contents light on fire a little, and the smoke drifts away..."
            }
            
            return justUse(it: item)
        case "baggy", "baggie", "bag":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE and smoke it."
            } else if player.pockets["PIPE"] != nil && player.pockets["BAGGY"] != nil {
                return "You try to use the LIGHTER on the contents of the BAGGY. The contents light on fire a little, and the smoke drifts away..."
            } else if player.pockets["PIPE"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE. But you have no way to light it."
            }
            
            return justUse(it: item)
        case "key":
            if player.here.objects["SHACK"] != nil  && !ShotgunShack.isAllowedIn() {
                ShotgunShack.allowedIn = true
                area.add(newNode: frontroom, to: porchOfAShotgunshack, at: .Down)
                area.add(newNode: bedroom, to: frontroom, at: .Left)
                area.add(newNode: makeshiftBedroom, to: frontroom, at: .Down)
                area.add(newNode: kitchen, to: makeshiftBedroom, at: .Down)
                area.add(newNode: bathroom, to: kitchen, at: .Left)
                area.add(newNode: laundryRoom, to: kitchen, at: .Right)
                area.add(newNode: basement, to: kitchen, at: .Down)
                area.add(newNode: secondBasement, to: basement, at: .Down)
                return "You unlock the LOCK on the door. You can now go DOWN into the SHACK."
            }
            
            return justUse(it: item)
        default:
            return justUse(it: item)
        }
    }
    
    override func whatsMy(_ query: String) -> String {
        switch query {
            
        case "name":
            return "Your name is \(player.name)."
        case "age":
            return "You recall a late 20th century pop-punk song from that time you had to take Classical Music Appreciation class. The music video they made you watch for it was very strange. Your teacher said it was designed to be comedic. People back then had a strange sense of humor."
        case "species":
            return "That's an ambigious question, and frankly kind of rude."
        case "race":
            return "That's a rude question."
        case "class":
            return "You're a humble citizen of the H.S.S. Cloud Mill, a Habitable Sapce Station sponsored by Dream Makers Absolute Zero Incorporated, The Twifoogle Company, Japan, India, Pakistan, Nigeria, the Manhattan-Brooklyn-Queens Collective (MBQC), Pacific Northwest Incorporated States (PNIS) & Unilab."
        case "job":
            return "You're unemployed."
        case "motivation":
            return "You don't have a lot of motivation. You like to hang out, meet new people, explore, and smoke with your pals."
        case "quest":
            return "You don't have a 'quest'. You think that calling whatever your goal in life is your quest is actually kind of pretentious."
        case "goal":
            return "You don't have any overarching goals. You like having fun, meeting people, smoking your pipe, exploring..."
        case "deal":
            return "You're kind of bored and lonely. It's tough being a monster sometimes. A lot of people think you're creepy just for existing. Others don't take you seriously, based purely on your appearance. Maybe the fanny pack and boxers don't help, but if they're going to think that anyway, why bother fitting in?"
        case "gender":
            return "You're still sorting that out, but you generally go by \(player.pronouns.joined(separator: "/")) pronouns when out in public."
        case "location":
            return "You are here: \(player.here.location)"
        case "status":
            return "Single."
        case "sex":
            return "You're still a virgin."
        default:
            return "That's a weird question."
        }
    }
}

class Area2: BasicInstructions {}
