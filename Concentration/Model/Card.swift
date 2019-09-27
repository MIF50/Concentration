//
//  Card.swift
//  Concentration
//
//  Created by BeInMedia on 9/20/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import Foundation
// struct is copy value
struct Card {
    var isFaceUp = false
    var isMatch = false
    var identifer = 0
    
    static var identiferFactory = 0
    
    static func getUnquieIdentifer()->Int {
        identiferFactory += 1
        return identiferFactory
    }
    
    init() {
        self.identifer = Card.getUnquieIdentifer()
    }
}
