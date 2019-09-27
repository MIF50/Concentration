//
//  Concentration.swift
//  Concentration
//
//  Created by BeInMedia on 9/20/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import Foundation
// class is a reference value
class Concentration {
    var cards = [Card]()
    
    
    var indexOfOneAndOnlyOneFaceup : Int?
    
    func chooseCard(at index: Int) {
        let card = cards[index]
        // if you choice one card face up
        // if you choiice one card and have 2 card faceup  face down these 2 card and than face up card you choices
        // if you choice card and there is one card is face up then make matching
        
        
        if !card.isMatch {
            if let matchIndex = indexOfOneAndOnlyOneFaceup, matchIndex != index {
                // check if card is matching
                if cards[matchIndex].identifer == cards[index].identifer {
                    cards[matchIndex].isMatch = true
                    cards[index].isMatch = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceup = nil
            } else {
                // no card or 2 card face up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyOneFaceup = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        
        // TODO: shuffle the card
    }
    
    
}
