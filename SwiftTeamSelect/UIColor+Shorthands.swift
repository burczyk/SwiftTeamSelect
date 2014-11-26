//
//  CGColor+Shorthands.swift
//  SwiftTeamSelect
//
//  Created by Kamil Burczyk on 30.06.2014.
//  Copyright (c) 2014 Sigmapoint. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    //convenience initializers
    
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat){
        self.init(red:r/255.0, green:g/255.0, blue:b/255.0, alpha:a)
    }
    
    convenience init(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat){
        self.init(red:r/255.0, green:g/255.0, blue:b/255.0, alpha:1)
    }
    
    //array of all flatUI colors
    
    class func flatUIColors() -> [UIColor] {
        return [UIColor.turquoise(), UIColor.emerald(), UIColor.peterRiver(), UIColor.amethyst(), UIColor.wetAsphalt(), UIColor.greenSea(), UIColor.nephritis(), UIColor.belizeHole(), UIColor.wisteria(), UIColor.midnightBlue(), UIColor.sunFlower(), UIColor.carrot(), UIColor.alizarin(), UIColor.clouds(), UIColor.concrete(), UIColor.orange(), UIColor.pumpkin(), UIColor.pomegranate(), UIColor.silver(), UIColor.asbestos()]
    }
    
    //convenience methods to return flatUI colors
    
    class func turquoise() -> UIColor {
        return UIColor(26, 188, 156)
    }
    
    class func emerald() -> UIColor {
        return UIColor(46, 204, 113)
    }

    class func peterRiver() -> UIColor {
        return UIColor(52, 152, 219)
    }
    
    class func amethyst() -> UIColor {
        return UIColor(155, 89, 182)
    }
    
    class func wetAsphalt() -> UIColor {
        return UIColor(52, 73, 94)
    }
    
    class func greenSea() -> UIColor {
        return UIColor(22, 160, 133)
    }
    
    class func nephritis() -> UIColor {
        return UIColor(39, 174, 96)
    }
    
    class func belizeHole() -> UIColor {
        return UIColor(41, 128, 185)
    }
    
    class func wisteria() -> UIColor {
        return UIColor(142, 68, 173)
    }
    
    class func midnightBlue() -> UIColor {
        return UIColor(44, 62, 80)
    }
    
    class func sunFlower() -> UIColor {
        return UIColor(241, 196, 15)
    }
    
    class func carrot() -> UIColor {
        return UIColor(230, 126, 34)
    }
    
    class func alizarin() -> UIColor {
        return UIColor(231, 76, 60)
    }
    
    class func clouds() -> UIColor {
        return UIColor(236, 240, 241)
    }
    
    class func concrete() -> UIColor {
        return UIColor(149, 165, 166)
    }
 
    class func orange() -> UIColor {
        return UIColor(243, 156, 18)
    }
    
    class func pumpkin() -> UIColor {
        return UIColor(211, 84, 0)
    }
    
    class func pomegranate() -> UIColor {
        return UIColor(192, 57, 43)
    }
    
    class func silver() -> UIColor {
        return UIColor(189, 195, 199)
    }
    
    class func asbestos() -> UIColor {
        return UIColor(127, 140, 141)
    }
    
}