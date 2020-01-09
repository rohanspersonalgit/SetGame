//
//  PlayingCardDeck.swift
//  Set
//
//  Created by Rohan Garg on 2019-12-22.
//  Copyright © 2019 RoFadez. All rights reserved.
//

import Foundation

struct PlayingCardDeck {
    var cardlimit: Int = 81
    var cards = [PlayingCard]()
    var chosenCards = [Int]()
    var currentTraights = [[Int]]()
    var allSame: Bool  = false
    var allDifferent: Bool = false
    var colorDifferent: Bool
    var shadeDifferent: Bool
    var shapeDifferent: Bool
    var numDifferent: Bool
    var playedCards = [PlayingCard]()
    var validSoFar: Bool
    var score: Int
    init(maxCards: Int) {
        for numShape in PlayingCard.NumShapes.all{
            for shape in PlayingCard.ShapeType.all{
                for shade in PlayingCard.Shade.all{
                    for color in PlayingCard.Color.all{
                        cards.append(PlayingCard(numShape: numShape,shapeType: shape,shade: shade, coloring: color))
                    }
                }
            }
        }
        for i in 0..<12 {
            let randoNum = cardlimit - i
            var newCard = (cards.remove(at: randoNum.arc4random))
            newCard.inGame = true
            playedCards.append(newCard)
        }
        validSoFar = true
        numDifferent = false; colorDifferent = false ; shapeDifferent = false ; shadeDifferent = false; score=0;
    }
    
    mutating func drawCard(numCards: Int) {
        
        if numCards<cards.count{            for _ in 1...numCards{
            let randoNum = cards.count
            var newCard = (cards.remove(at: randoNum.arc4random))
            newCard.inGame = true
            playedCards.append(newCard)
            }}
        
    }
    
    mutating func chooseCard(cardChose: Int){
        if(!playedCards[cardChose].chosen){
            playedCards[cardChose].chosen = true
            if(chosenCards.count==0){
                chosenCards.append(cardChose)
            }
            else if(chosenCards.count==1){
                let lastChose = playedCards[chosenCards[0]]
                let currChose = playedCards[cardChose]
                if (lastChose.color != currChose.color){
                    colorDifferent = true
                }
                if(lastChose.shading != currChose.shading){
                    shadeDifferent = true
                }
                if(lastChose.numShapes != currChose.numShapes){
                    numDifferent = true
                }
                if(lastChose.shape != currChose.shape){
                    shapeDifferent = true
                }
                chosenCards.append(cardChose)
            } else if(chosenCards.count) == 2 {
                chosenCards.append(cardChose)
                let firstChose = playedCards[chosenCards[0]]
                let lastChose = playedCards[chosenCards[1]]
                let currChose = playedCards[chosenCards[2]]
                
                if(firstChose.color == currChose.color && lastChose.color == currChose.color){
                    if(colorDifferent){
                        validSoFar = false
                    }
                }
                if(firstChose.shape == currChose.shape && lastChose.shape == currChose.shape){
                    if shapeDifferent {validSoFar = false}
                }
                
                if(firstChose.numShapes == currChose.numShapes || lastChose.numShapes == currChose.numShapes){
                    if numDifferent {validSoFar = false}
                }
                if(firstChose.shading == currChose.shading || lastChose.shading == currChose.shading){
                    if shadeDifferent {validSoFar = false}
                }
                if(validSoFar){
                    for each in chosenCards{
                        playedCards[each] = cards.remove(at: cards.count.arc4random)
                        playedCards[each].inGame = true
                    }
                    score += 3
                    chosenCards.removeAll()
                }
                else {
                    validSoFar = false
                    numDifferent = false
                    shadeDifferent = false
                    colorDifferent = false
                    shapeDifferent = false
                    for each in chosenCards{
                        playedCards[each].chosen = false
                        playedCards[each].inGame = true
                    }
                    score -= 5
                    chosenCards.removeAll()
                }
            }
        }
        else {
            score -= 1
            playedCards[cardChose].chosen = false
            if let remove = chosenCards.firstIndex(of: cardChose){
                chosenCards.remove(at: remove)
            }
        }
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }
        else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        }
        else {
            return 0
        }
    }
}
