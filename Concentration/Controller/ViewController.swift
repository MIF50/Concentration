//
//  ViewController.swift
//  Concentration
//
//  Created by BeInMedia on 9/13/19.
//  Copyright © 2019 MIF50. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    var flipCount =  0 {
        didSet {
            flibCountLabel.text = "Flibs: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBOutlet weak var flibCountLabel: UILabel!
    
//    var emojiChoices = ["👻","🎃","👻","🎃"]
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("CardNumber \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
//            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Chosen number was not in card buttons")
        }
       
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatch ? #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }

        }
    }
    
    var emojiChoices = ["🦇", "😱", "🙀", "😈", "🎃", "👻", "🍭", "🍬", "🍎"]
    var emoji = [Int: String]()
    func emoji(for card: Card) -> String {
        if emoji[card.identifer] == nil, emojiChoices.count > 0 {
            // put emoji in dictionary to that card
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count - 1)))
            // when put emoji to card remove it from emoji choices
            emoji[card.identifer] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifer] ?? "?"
    }
    

    
    func flipCard(withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        } else {
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

