//
//  InputParser.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

class InputResponder {
    let keywords = [
        "repeat"
        ,"take"
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
    
    let ambleVerbs = [
        "go"
        , "head"
        , "walk"
        , "run"
        , "skip"
        , "jump"
        , "dance"
        , "amble"
        , "jog"
        , "hop"
        , "sneak"
        , "strafe"
        , "travel"
        , "stomp"
    ]
    
    var previousCommand: String
    let player: Player
    var area: Graph
    
    init(player: Player, area: Graph, previousCommand: String = "") {
        self.player = player
        self.area = area
        self.previousCommand = previousCommand
    }
    
    func stackUp(_ input: String) {
        previousCommand = input
    }
    
    func caseDown(_ text: String) -> String {
        return text.lowercased()
    }
    
    func breakUp(_ text: String) -> [String] {
        return text.components(separatedBy: " ")
    }
    
    func respond(to text: String) -> String {
        guard !text.isEmpty else {
            return "Type something!"
        }
        
        let input = caseDown(text)
        let inspectInput = breakUp(input)
        let firstWord = inspectInput[0]
        let lastWord = inspectInput[inspectInput.count - 1]
        
        guard keywords.contains(firstWord) else {
            return "Huh?"
        }
        
        switch input {
        case _ where inspectInput.count > 2 && (firstWord + " " + inspectInput[1]) == "what's my":
            return whatsMy(lastWord)
        case _ where inspectInput.count > 2 && (firstWord + " " + inspectInput[1]) == "what's your":
            return whatsMy(lastWord)
        case _ where inspectInput.count > 1 && ambleVerbs.contains(firstWord):
            return travel(lastWord)
        case _ where inspectInput.count > 1 && firstWord == "take":
            return take(lastWord)
        case _ where inspectInput.count > 1 && firstWord == "change":
            return change(lastWord)
        case _ where inspectInput.count > 1 && firstWord == "use":
            return use(lastWord)
        case _ where inspectInput.count > 1 && firstWord == "look":
            return look(at: lastWord)
        case "where am i", "where am i?", "where are we?", "where are we":
            return player.here.description
        case "what am i", "what am i?", "exists":
            return existentialism()
        case "help", "help!", "help?":
            return help()
        case "left", "right", "down", "up":
            return travel(input)
        case "repeat":
            return repeatLast()
        case "exits":
            return exits()
        case "pockets":
            return pockets()
        case "look":
            return look(at: player.here.location)
        case "quit":
            print("Bye, \(player.name)!")
            exit(0)
        default:
            return "??"
        }
        
        return "?"
    }
    
    func help() -> String {
        return "Here are a list of commands you can use: \n * look -- look around your current location\n * look at ___ -- look at an object, direction, or character\n * exits -- see all the exits\n * left, right, up, or down -- travel in that direction (from a 2D, top-down perspective)\n * pockets -- check your fanny pack's pockets\n * take ___ -- put an object inside your fanny pack\n * use ___ -- use an object in your fanny pack\n * what's my ___ -- ask a personal question\n * repeat -- repeat the last command\n * quit -- quit the game\n"
    }
    
    func repeatLast() -> String {
        if previousCommand != "" {
            return respond(to: previousCommand)
        } else {
            return "There's nothing to repeat."
        }
    }
    
    func exits() -> String {
        let name = player.here.location
        
        if let found = area.allNames[name] {
            let placeholder = "deadend"
            let spaces = String(repeating: " ", count: found.pathsOut.left?.location.characters.count ?? placeholder.characters.count)
            
            return "You check for exits:\n\n\(spaces)UP: \(found.pathsOut.up?.location ?? placeholder)\nLEFT: \(found.pathsOut.left?.location ?? placeholder) + RIGHT: \(found.pathsOut.right?.location ?? placeholder)\n\(spaces)DOWN: \(found.pathsOut.down?.location ?? placeholder)"
        } else {
            return "We can't find \(name) on the map."
        }
    }
    
    func change(_ input: String) -> String {
        if input == "name" {
            print("Your name is currently \(player.name). What would you like to change your name to?")
            print(">")
            let response = readLine()
            player.name = response?.capitalized ?? player.name
            return "Your name is now \(player.name)."
        } else if input == "pronouns" {
            print("Your pronouns are currently \(player.pronouns.joined(separator: "/")). What would you like to change your pronouns to?")
            print(">")
            let response = readLine()
            player.pronouns = response?.components(separatedBy: "/") ?? player.pronouns
            return "Your pronouns are now \(player.pronouns.joined(separator: "/"))."
        } else if input == "kind" {
            return "You can go from being something else to being a Monster, but it's a one-way trip."
        } else {
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
        
        switch direction {
        case "left":
            guard let left = player.here.pathsOut.left else {
                return error
            }
            
            player.here = left
        case "down":
            guard let down = player.here.pathsOut.down else {
                return error
            }
            
            player.here = down
        case "right":
            guard let right = player.here.pathsOut.right else {
                return error
            }
            
            player.here = right
        case "up":
            guard let up = player.here.pathsOut.up else {
                return error
            }
            
            player.here = up
        default:
            return error
        }
        
        return "You go \(direction.uppercased()).\n\(player.here.description)"
    }
    
    func take(_ object: String) -> String {
        if !player.here.objects.isEmpty {
            if let hasObject = player.here.objects[object.uppercased()] {
                if hasObject.isPocketable() {
                    if player.pockets.count < 6 {
                        player.take(hasObject as! Item)
                        player.here.objects[object] = nil
                        return "You take the \(object) and put it in your fanny pack."
                    } else {
                        return "Your fanny pack is full!"
                    }
                } else {
                    return "You can't take that!"
                    
                }
            }
            return "What? Nothing like that is here."
        }
        return "There's nothing to take here."
    }
    
    func look(at thing: String) -> String {
        if let found = area.allNames[thing] {
            return found.description
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
                return "You see a deadend to your \(thing)."
            }
        case "down":
            if let down = player.here.pathsOut.down {
                return "You look \(thing) and see a \(down.location)."
            } else {
                return "You see a deadend to your \(thing)."
            }
        case "right":
            if let right = player.here.pathsOut.right {
                return "You look \(thing) and see a \(right.location) ."
            } else {
                return "You see a deadend to your \(thing)."
            }
        case "up":
            if let up = player.here.pathsOut.up {
                return "You look \(thing) and see a \(up.location)."
            } else {
                return "You see a deadend to your \(thing)."
            }
        case "pockets":
            return pockets()
        default:
            return "We can't see anything."
        }
    }
    
    func use(_ item: String) -> String {
        let error = "What \(item)? You don't have a \(item)."
        
        switch item {
        case "pipe":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE and light it with your LIGHTER."
            }
            
            if player.pockets["PIPE"] != nil {
                return "You put the PIPE in your mouth. It's empty. You look kind of silly."
            } else {
                return error
            }
        case "lighter":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE and light it with your LIGHTER."
            }
            if player.pockets["LIGHTER"] != nil {
                return "You flick the LIGHTER on. Ooh, pretty."
            } else {
                return error
            }
        case "key":
            if player.pockets["KEY"] != nil {
                return "You try to use the KEY to unlock thin air."
            } else {
                return error
            }
        case "scoobysnacks", "snacks", "treats", "dogtreats", "box":
            if player.pockets["BOX"] != nil {
                return "You eat a Scooby Snack. Yum!"
            } else {
                return error
            }
        case "baggy", "baggie", "bag":
            if player.pockets["PIPE"] != nil && player.pockets["LIGHTER"] != nil && player.pockets["BAGGY"] != nil {
                return "You put the stuff inside the BAGGY in your PIPE and smoke it."
            }
            if player.pockets["BAGGY"] != nil {
                return "You open up the BAGGY and sniff it. It's stinky."
            } else {
                return "What \(item)? You don't have a \(item)."
            }
        default:
            return "You can't do that!"
        }
    }
    
    func whatsMy(_ query: String) -> String {
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
    
    func existentialism() -> String {
        return "Your name is \(player.name) and you are a \(player.kind).\n\n\(player.appearance)"
    }
}

