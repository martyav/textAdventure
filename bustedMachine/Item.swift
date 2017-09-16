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
    func printName()
    func printDescription()
}

struct Item: InanimateObject {
    var name: String
    var description: String
    var pocketable: Bool
    var contents: [String: Item]
    
    init(name: String, description: String, pocketable: Bool, contents: [String:Item] = [:]) {
        self.name = name
        self.description = description
        self.pocketable = pocketable
        self.contents = contents
    }
    
    func isPocketable() -> Bool {
        return pocketable
    }
    
    func printName() {
        print("This is a \(name)")
    }
    
    func printDescription() {
        print(description)
    }
}

struct Vehicle: InanimateObject {
    var name: String
    var description: String
    let pocketable: Bool
    let allowedOn: Bool
    
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
    
    func printName() {
        print("This is \(name)")
    }
    
    func printDescription() {
        print(description)
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
    
    func printName() {
        print("This is \(name)")
    }
    
    func printDescription() {
        print(description)
    }
}
