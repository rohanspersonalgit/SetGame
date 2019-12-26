//
//  PlayingCard.swift
//  Set
//
//  Created by Rohan Garg on 2019-12-22.
//  Copyright © 2019 RoFadez. All rights reserved.
//

import Foundation

struct PlayingCard {
    
    var numShapes: NumShapes
    var shape: ShapeType
    var shading: Shade
    var color: Color
    var chosen: Bool
    var matched: Bool
    var inGame: Bool 
    enum NumShapes: Int {
        case one = 1
        case two = 2
        case three = 3
        static var all = [NumShapes.one, .two, .three]
    }
    
    enum ShapeType: String {
        case diamond = "▲"
        case squiggle = "■"
        case oval = "●"
        static var all = [ShapeType.diamond,ShapeType.squiggle,.oval]
    }
    
    enum Shade: String {
        case solid = "solid"
        case striped = "striped"
        case open = "open"
        static var all = [Shade.solid,.striped,.open]
    }
    
    enum Color: Int {
        case red = 0xff0000
        case green = 0x00ff00
        case purple = 0x800080
        static var all = [Color.red,.green,.purple]
    }
    init(numShape: NumShapes, shapeType: ShapeType, shade: Shade, coloring: Color) {
        numShapes = numShape
        shape = shapeType
        shading = shade
        color = coloring
        matched = false
        chosen = false
        inGame = false
    }
    
}
