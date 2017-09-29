//
//  Item.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

protocol InanimateObject {
    var name: String { get }
    var description: String { get }
    var pocketable: Bool { get }
    
    func isPocketable() -> Bool
    func stateName() -> String
}

struct Item: InanimateObject {
    var name: String
    var description: String
    var pocketable: Bool
    let replenishable: Bool
    var contents: [String: Item]
    var simpleUse: String
    
    init(name: String, description: String, pocketable: Bool, replenishable: Bool = false, contents: [String:Item] = [:], simpleUse: String = "You're not sure how to use that.") {
        self.name = name
        self.description = description
        self.pocketable = pocketable
        self.replenishable = replenishable
        self.contents = contents
        self.simpleUse = simpleUse
    }
    
    func isPocketable() -> Bool {
        return pocketable
    }
    
    func isReplenishable() -> Bool {
        return replenishable
    }
    
    func stateName() -> String {
        return "This is a \(name)."
    }
}

struct Vehicle: InanimateObject {
    var name: String
    var description: String
    let pocketable: Bool
    var allowedOn: Bool
    
    init(name: String, description: String, pocketable: Bool = false, allowedOn: Bool) {
        self.name = name
        self.description = description
        self.pocketable = pocketable
        self.allowedOn = allowedOn
    }
    
    func isPocketable() -> Bool {
        return pocketable
    }
    
    func isAllowedOn() -> Bool {
        return allowedOn
    }
    
    func stateName() -> String {
        return "This is \(name)"
    }
}

struct Building: InanimateObject {
    var name: String
    var description: String
    let pocketable: Bool
    var allowedIn: Bool
    
    init(name: String, description: String, pocketable: Bool = false, allowedIn: Bool) {
        self.name = name
        self.description = description
        self.pocketable = pocketable
        self.allowedIn = allowedIn
    }
    
    func isPocketable() -> Bool {
        return pocketable
    }
    
    func isAllowedIn() -> Bool {
        return allowedIn
    }
    
    func stateName() -> String {
        return "This is \(name)"
    }
}
