//
//  Card.swift
//  Concentration
//
//  Created by BeInMedia on 9/20/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import Foundation

struct Card: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifer)
    }
     
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.identifer == rhs.identifer
    }
    
    
    var isFaceUp = false
    var isMatched = false
    private var identifer = 0
    
    private static var identiferFactory = 0
    
    private static func getUnquieIdentifer()->Int {
        identiferFactory += 1
        return identiferFactory
    }
    
    init() {
        self.identifer = Card.getUnquieIdentifer()
    }
}
