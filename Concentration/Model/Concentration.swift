//
//  Concentration.swift
//  Concentration
//
//  Created by BeInMedia on 9/20/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import Foundation

struct Concentration {
   private(set) var cards = [Card]()
    
    private var indexOfOneAndOnlyOneFaceup : Int? {
        get {
            // get index of item of list of index == 1 ortherwise set to nil
            return cards.indices.filter{ cards[$0].isFaceUp }.oneAndOnly
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (newValue == index)
            }
        }
    }
    
    mutating func chooseCard(at index: Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCard(at: \(index)) choose index not found in card ")
        
        let card = cards[index]
        // if you choice one card face up
        // if you choice one card and have 2 card faceup  face down these 2 card and than face up card you choices
        // if you choice card and there is one card is face up then make matching
        
        
        if !card.isMatched {
            if let matchIndex = indexOfOneAndOnlyOneFaceup, matchIndex != index {  // check if card is matching and not the same index
                if cards[matchIndex] == cards[index] {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
            } else {   // no card or 2 card face up
                indexOfOneAndOnlyOneFaceup = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0,"init(\(numberOfPairsOfCards)) you must have at least one pair of cards ")
        for _ in 1 ... numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
    }
    
    
}

extension Collection {
    var oneAndOnly : Element? {
        return count == 1 ? first : nil
    }
}
