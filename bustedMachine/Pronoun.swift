//
//  Pronoun.swift
//  bustedMachine
//
//  Created by Marty Hernandez Avedon on 09/26/17.
//  Copyright © 2017 Marty's . All rights reserved.
//

import Foundation

class PronounSet {
    static let who = "who/whom/whose"
    static let they = "they/them/their"
    static let it = "it/its/its"
    static let he = "he/him/his"
    static let she = "she/her/her"
    static let ze = "ze/hir/hir"
    static let e = "'e/'em/'eir"
    static let we = "we/our/our"
    static let you = "you/you/your"
    
    static func randomPick() -> String {
        let pronouns = [they, he, she, ze, e]
        let randomIndex = Int(arc4random_uniform(UInt32(pronouns.count)))
        return pronouns[randomIndex]
    }
    
    private init() {}
}
