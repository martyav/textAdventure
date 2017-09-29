//
//  Conversation.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/28/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

func wolfConversation(_ input: String) -> String {
    if player.here.npcs[Werewolf.name] != nil && player.here.description == "You are standing in a mucky forest. Bare black TREES grow in loose arrangements. A werewolf named \(Werewolf.name) is sitting on some LOGS." {
        switch input {
        case "hi", "hello", "howdy", "hey", "hola":
            return "You say, \"\(input)\".\n\n\(Werewolf.name) wags \(Werewolf.pronouns[2]) tail. \(Werewolf.pronouns[0].capitalized) seems hungry..."
        case "who are you", "who're you", "who are you?", "who're you?":
            return "You say, \"\(input)\".\n\nThe werewolf says, \"What? Don't you recognize me? I'm your pal, \(Werewolf.name). We met down at the shack last weekend. I'm not that great at faces either, but dang it, I'm a blue furry wolf. C'mon.\""
        case "how are you", "how are you?", "what's up?", "what's up", "sup", "'sup":
            return "You say, \"\(input)\".\n\n\(Werewolf.name) smiles and says, \"Nothing much. Hey, do you happen to have any Scooby Snacks? I'm all out.\""
        case "what are scooby snacks", "what are scooby snacks?":
            return "\(Werewolf.name) says, \"Scooby Snacks are tasty treats you can eat or smoke. There was a recent recall due to salmonella, but that doesn't effect Monsters one bit.\""
        case "where can i find scooby snacks", "where can i find them", "where can i find them?", "where can i find scooby snacks?", "where do you get scooby snacks", "where are scooby snacks", "where are scooby snacks?", "where do you get scooby snacks?", "where do you get them", "where do you get them?":
            return "\(Werewolf.name) says, \"Well, normally, you'd buy them, but there was a recall recently so they're off store shelves. You have to dumpster dive.\""
        case "fuck you", "fuck off", "gtfo", "go away":
            player.here.description = "You are standing in a mucky forest. Bare black TREES grow in loose arrangements. The ground is covered in tall GRASS, CLOVER, and scratchy WEEDS. There are also many recently felled TREES. These LOGS provide dry footing and can be USED as a place to sit."
            return "You say, \"\(input)\".\n\nThe werewolf growls \"No, you \(input)\" and disappears back into the forest."
        case "hey hot stuff", "let's make out", "hey pretty", "you're cute", "hey baby", "you're hot", "hey sexy", "hey hottie":
            return "You say, \"\(input)\".\n\nThe werewolf seems a little put off by your forwardness.\n\nMaybe you shouldn't be sexually harassing werewolves?"
        case _ where input.components(separatedBy: " ").last == "bitch":
            fallthrough
        case "die", "kill yourself", "foad":
            print("You say, \"\(input)\".\n\nThe werewolf blinks.\n\nThe werewolf lunges at your throat.\n\nThe werewolf spits out foam.\n\nYour fuzzy outer covering is torn to shreds, but you remain fully conscious.\n\nThe werewolf's claws tear through your Kevlar rib lining.\n\nThe werewolf smashes through your PVC ribcage.\n\nThe werewolf rips open the medical-grade plastic sac containing your heart and lungs.\n\nYou can no longer breathe.\n\nYou die.\n\nBye, \(player.name)!")
            exit(0)
        case _ where player.pockets[Lighter.name] != nil:
            switch input {
            case "bye", "bye-bye", "goodbye", "see ya":
                return "You say, \"\(input)\".\n\n\(Werewolf.name) waves goodbye to you happily and blows you a kiss."
            case "thank you", "thanks":
                return "You say, \"\(input)\".\n\n\(Werewolf.name) winks at you and makes finger guns. \"No problem,\" \(Werewolf.pronouns[0]) says. \"I haven't had a good Scooby Snack in weeks.\""
            default:
                return "You say \"\(input)\". \(Werewolf.name) is nonplussed."
            }
        case _ where player.pockets[ScoobySnacks.name] != nil:
            switch input {
            case "yes", "yeah", "yup":
                return "You say, \"\(input)\".\n\n\(Werewolf.name)'s ears perk up eagerly. You'll have to USE the box you found to offer \(Werewolf.pronouns[1]) some treats."
            case "no", "nope", "nah":
                return "You say, \"\(input)\".\n\n\(Werewolf.name) frowns. \"That's funny...I thought I smelled something,\" \(Werewolf.pronouns[0]) says."
            default:
                return "You say, \(input).\n\n\(Werewolf.name) is nonplussed."
            }
        case _ where player.pockets[ScoobySnacks.name] == nil:
            switch input {
            case "yes", "yeah", "yup":
                return "You say, \"\(input)\".\n\n\(Werewolf.name)'s ears perk up eagerly. But \(Werewolf.pronouns[0]) doesn't smell any Scooby Snacks on you..."
            case "no", "nope", "nah":
                return "You say, \"\(input)\".\n\n\(Werewolf.name) frowns. \"Sometimes I find unopened boxes of them when I go dumpster diving,\" \(Werewolf.pronouns[0]) says."
            default:
                return "You say \"\(input)\". \(Werewolf.name) is nonplussed."
            }
        default:
            return "You say, \"\(input)\". \(Werewolf.name) is nonplussed."
        }
    } else if player.here.npcs[Werewolf.name] != nil && player.here.description == "You are standing in a mucky forest. Bare black TREES grow in loose arrangements. The ground is covered in tall GRASS, CLOVER, and scratchy WEEDS. There are also many recently felled TREES. These LOGS provide dry footing and can be USED as a place to sit." {
        return "You say, \"\(input)\".\n\nYou have the feeling that someone can hear you."
    }
    
    return "You say, \"\(input)\". \(Werewolf.name) is nonplussed."
}

func monsterPartyConversation(_ input: String) -> String {
    let monsters = [Cookiepuss, Possum, FutureCreep]
    let randomNumber = Int(arc4random_uniform(UInt32(3)))
    let randomizeSpeaker = monsters[randomNumber]
    
    switch input {
    case "hi", "hola", "hey", "hello":
        return "You say, \"\(input)\". \(Cookiepuss.name) grins and says \"\(input)\" back. \(FutureCreep.name) nods. \(Possum.name) makes a little wave."
    case "how are you", "how are you?", "what's up", "what's up?", "sup", "'sup", "what's going on", "what's going on?":
        if randomizeSpeaker == Cookiepuss {
            return "\(Cookiepuss.name) says, \"We've been waiting for you, ya big Elmo. Did you remember to bring the baggy?\""
        } else if randomizeSpeaker == Possum {
            return "\(Possum.name) says, \"I've been better. Did you grab the baggy upstairs?\""
        } else if randomizeSpeaker == FutureCreep {
            return "\(FutureCreep.name) says \"Is cool, is cool. You know, daddy-o. Did you happen to run across that baggy?\""
        }
    case "who are you", "who are you?", "who are you guys", "who are you guys?":
        if randomizeSpeaker == Cookiepuss {
            return "\(Cookiepuss.name) says, \"It's ya boy, Cookiepuss.\""
        } else if randomizeSpeaker == Possum {
            return "\(Possum.name) asks, \"Are you serious?\""
        } else if randomizeSpeaker == FutureCreep {
            return "\(FutureCreep.name) says \"I'm your friend, what the hiccup, dog. You flip-trippin' or something? You're so weird.\""
        }
    case "get out", "go away", "fuck off", "foad", "wtf", "what the fuck", "leave", "leave me alone":
        if randomizeSpeaker == Cookiepuss {
            return "\(Cookiepuss.name) laughs. \(Cookiepuss.pronouns[0].capitalized) says, \"Stop kidding around and light us up already, you fricking Fozzie.\""
        } else if randomizeSpeaker == Possum {
            return "\(Possum.name) blinks, then gives you the finger."
        } else if randomizeSpeaker == FutureCreep {
            return "\(FutureCreep.name) says \"Why you gotta say things like that, cat?\""
        }
    case "yes", "yup", "yep", "of course":
        if randomizeSpeaker == Cookiepuss {
            return "\(Cookiepuss.name) nods. \(Cookiepuss.pronouns[0].capitalized) says, \"Well, if we've got the baggy, a pipe, and a light, we can get down to business.\""
        } else if randomizeSpeaker == Possum {
            return "\(Possum.name) says, \"Good. Now all we need is a pipe and a lighter and we'll be set.\"."
        } else if randomizeSpeaker == FutureCreep {
            return "\(FutureCreep.name) says \"Most excellent, my elephant. Fricking tubular. Hopefully you remembered to tag along a pipe and a light, so we can smoke up something righteous.\""
        }
    case "no", "nope", "nah":
        if randomizeSpeaker == Cookiepuss {
            return "\(Cookiepuss.name) says, \"The baggy...c'mon...I think I left it in the bedroom.\""
        } else if randomizeSpeaker == Possum {
            return "\(Possum.name) says, \"Then go back upstairs and get it.\"."
        } else if randomizeSpeaker == FutureCreep {
            return "\(FutureCreep.name) says \"No? Whatcha doing, pal? We've been waiting. Check the bedrooms. Last I remember, Cookiepuss was smoking in there.\""
        }
    default:
        return "You say, \"\(input)\". Everyone shrugs."
    }
    return "You say, \"\(input)\". Everyone shrugs."
}
