//
//  ViewController.swift
//  Set
//
//  Created by Rohan Garg on 2019-12-22.
//  Copyright © 2019 RoFadez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var game = PlayingCardDeck(maxCards: 81)
    var cardsInPlay:Int { get {
        game.playedCards.count
        }}
     //var grid: Grid = Grid(layout: Grid.Layout.dimensions(rowCount: 4, columnCount: 3))
    @IBOutlet  var cardButtons: [UIButton]!
    @IBOutlet var setCardView: [SetCardView]!
    
    @IBOutlet weak var gameScoreLabel: UILabel!
    var gameScore = 0 {
        didSet {
            gameScoreLabel.text = "GameScore: \(gameScore)"
        }
    }
    @IBOutlet weak var drawThree: UIButton!
    
    @IBAction func drawThreeCards() {
        game.drawCard(numCards: 3)
        updateViewFromModel()
        print(game.playedCards)
    }
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender){
            if cardNumber <= game.playedCards.count{
                game.chooseCard(cardChose: cardNumber)
                updateViewFromModel()
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromModel()
    }
    
    func updateViewFromModel(){
//        if(grid.cellCount==game.playedCards.count){
//            for _ in 0...setCardView.count{
//                print("heleo")
//            }
//        }else {
//            //resize!
//        }
        for card in (cardButtons.indices){
            if (card > game.playedCards.count - 1 ){
                cardButtons[card].backgroundColor = #colorLiteral(red: 0.9465195487, green: 1, blue: 0.9535968211, alpha: 0)
                cardButtons[card].setTitle("", for: .normal)
            } else if game.playedCards[card].inGame, !game.playedCards[card].matched{
                cardButtons[card].backgroundColor = UIColor.init(rgb: 0xf0ead6)
                var coloring = UIColor(rgb: game.playedCards[card].color.rawValue)
                var attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.systemFont(ofSize: 10)
                ]
                let str = String(repeating: game.playedCards[card].shape.rawValue,count: game.playedCards[card].numShapes.rawValue)
                if(game.playedCards[card].shading == PlayingCard.Shade.striped){
                    coloring = coloring.withAlphaComponent(0.15)
                    attributes[.foregroundColor] = coloring
                }
                else if (game.playedCards[card].shading == PlayingCard.Shade.open ){
                    attributes[.strokeWidth] = 10
                }
                if(game.playedCards[card].chosen){
                    cardButtons[card].backgroundColor = UIColor.init(rgb: 0xf0ead6)
                }
                else {
                    cardButtons[card].backgroundColor = UIColor.init(named: "white")
                }
                let attString = NSAttributedString(string: str, attributes: attributes)
                cardButtons[card].setAttributedTitle(attString, for: .normal)
                cardButtons[card].layer.borderWidth = 10.0
                cardButtons[card].layer.borderColor = UIColor.init(rgb: game.playedCards[card].color.rawValue).cgColor
                
            }
            else {  
                cardButtons[card].layer.borderColor = #colorLiteral(red: 0.9465195487, green: 1, blue: 0.9535968211, alpha: 0)
                cardButtons[card].backgroundColor = #colorLiteral(red: 0.9465195487, green: 1, blue: 0.9535968211, alpha: 0)
                let attString = NSAttributedString(string: "", attributes: [:])
                cardButtons[card].setAttributedTitle(attString, for: .normal)
                
            }
        }
        gameScore = game.score
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
