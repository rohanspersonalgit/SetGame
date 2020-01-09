//
//  SetCardView.swift
//  Set
//
//  Created by Rohan Garg on 2019-12-29.
//  Copyright © 2019 RoFadez. All rights reserved.
//

import UIKit
class SetCardView: UIView {
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    var shape:String = ""
    
    enum Shape: String{
        case diamond = "▲"
        case squiggle = "■"
        case oval = "●"
        
    }
    
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//    }
//    
//    override func draw(_ rect: CGRect) {
//        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        roundedRect.addClip()
//        UIColor.white.setFill()
//        roundedRect.fill()
//    }
    
}

extension SetCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let faceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    private var cornerFontSize: CGFloat {
        return bounds.size.height * SizeRatio.cornerFontSizeToBoundsHeight
    }
    
}
