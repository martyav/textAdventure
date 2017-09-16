//
//  Node.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

class Node: Equatable {
    let location: String
    var description: String
    var pathsOut: Path
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.location == rhs.location &&
            lhs.description == rhs.description
    }
    
    init(location: String, description: String, pathsOut: Path = Path((nil,nil,nil,nil))) {
        self.location = location
        self.description = description
        self.pathsOut = pathsOut
    }
}
