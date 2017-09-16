//
//  Graph.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

class Graph {
    let startingPoint: Node
    var allNames: [String: Node]
    
    init(startingPoint: Node) {
        self.startingPoint = startingPoint
        self.allNames = [startingPoint.location: startingPoint]
    }
    
    func quickFind(_ name: String) -> Node? {
        return allNames[name]
    }
    
    func printDescription(_ name: String) {
        if let found = allNames[name] {
            print(found.description)
        } else {
            print("We can't find \(name).")
        }
    }
    
    func printConnections(_ name: String) {
        if let found = allNames[name] {
            let placeholder = "deadend"
            
            print("LEFT: \(found.pathsOut.left?.location ?? placeholder); DOWN: \(found.pathsOut.down?.location ?? placeholder); RIGHT: \(found.pathsOut.right?.location ?? placeholder); UP: \(found.pathsOut.up?.location ?? placeholder)")
        } else {
            print("We can't find \(name).")
        }
    }
    
    func add(newNode: Node, to attachmentPoint: Node, at direction: Direction) {
        guard let existingNode = quickFind(attachmentPoint.location) else {
            print("We can't find that location!")
            return
        }
        
        allNames[newNode.location] = newNode
        
        switch direction {
        case .Left:
            if existingNode.pathsOut.left == nil {
                newNode.pathsOut.right = existingNode
                existingNode.pathsOut.left = newNode
            } else {
                print("We can't place \(newNode.location) to the \(direction) of \(attachmentPoint.location)!")
            }
        case .Down:
            if existingNode.pathsOut.down == nil {
                newNode.pathsOut.up = existingNode
                existingNode.pathsOut.down = newNode
            } else {
                print("We can't place \(newNode.location) to the \(direction) of \(attachmentPoint.location)!")            }
        case .Right:
            if existingNode.pathsOut.right == nil {
                newNode.pathsOut.left = existingNode
                existingNode.pathsOut.right = newNode
            } else {
                print("We can't place \(newNode.location) to the \(direction) of \(attachmentPoint.location)!")
            }
        case .Up:
            if existingNode.pathsOut.up == nil {
                newNode.pathsOut.down = existingNode
                existingNode.pathsOut.up = newNode
            } else {
                print("We can't place \(newNode.location) to the \(direction) of \(attachmentPoint.location)!")            }
        }
    }
    
    func delete(_ name: String) {
        guard let location = quickFind(name) else {
            print("We can't find it!")
            return
        }
        
        if let leftSide = location.pathsOut.left {
            leftSide.pathsOut.right = nil
        } else {
            print("Already clear")
        }
        
        if let downSide = location.pathsOut.down {
            downSide.pathsOut.up = nil
        } else {
            print("Already clear")
        }
        
        if let rightSide = location.pathsOut.right {
            rightSide.pathsOut.left = nil
        } else {
            print("Already clear")
        }
        
        if let upSide = location.pathsOut.up {
            upSide.pathsOut.down = nil
        } else {
            print("Already clear")
        }
        
        allNames[name] = nil
    }
}
