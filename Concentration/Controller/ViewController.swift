//
//  ViewController.swift
//  Concentration
//
//  Created by BeInMedia on 9/13/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOfPairsOfCards: Int { (cardButtons.count + 1) / 2 }
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    
    private(set) var flipCount =  0 {
        didSet {
            updateFlibCountLabel()
        }
    }
    
    private func updateFlibCountLabel() {
        let attributes: [NSAttributedString.Key: Any] = [
                        .strokeWidth : 5.0,
                        .strokeColor : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
                    ]
                    let attributedString = NSAttributedString(string: "Flibs: \(flipCount)", attributes: attributes)
                    flibCountLabel.attributedText = attributedString
        //            flibCountLabel.text = "Flibs: \(flipCount)"
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBOutlet private weak var flibCountLabel: UILabel! {
        didSet {
            updateFlibCountLabel()
        }
    }
        
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Chosen number was not in card buttons")
        }
       
    }
    
    private func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
//    private var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    private var emojiChoices = "🦇😱🙀😈🎃👻🍭🍬🍎"

    private var emoji = [Card: String]()
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            // put emoji in dictionary to that card
            // when put emoji to card remove it from emoji choices
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4radom)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4radom: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

