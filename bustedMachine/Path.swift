//
//  Path.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/16/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

struct Path {
    var left: Node?
    var down: Node?
    var right: Node?
    var up: Node?
    
    init(_ directions: (left: Node?, down: Node?, right: Node?, up: Node?)) {
        self.left = directions.left
        self.down = directions.down
        self.right = directions.right
        self.up = directions.up
    }
}
