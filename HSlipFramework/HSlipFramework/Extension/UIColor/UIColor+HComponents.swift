//
//  UIColor+General.swift
//  Drop
//
//  Created by hushaohua on 2017/12/17.
//  Copyright © 2017年 init. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    static func h_blue() -> UIColor{
        return UIColor.rgbColor(0x0a, 0x73, 0xfe)
    }
    
    static func h_darkBlue() -> UIColor{
        return UIColor.rgbColor(30, 41, 61)
    }
    
    static func h_lightblue() -> UIColor{
        return UIColor.rgbColor(0xC9, 0xE3, 0xFE);
    }
    
    static func p3RGBColor(_ red:Int, _ green: Int, _ blue: Int) -> UIColor{
        //B0E2FF
        return UIColor(displayP3Red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1);
    }
    static func rgbColor(_ red:Int, _ green: Int, _ blue: Int) -> UIColor{
        //B0E2FF
        return UIColor(red: CGFloat(red)/255, green: CGFloat(green)/255, blue: CGFloat(blue)/255, alpha: 1);
    }
}
