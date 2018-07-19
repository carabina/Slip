//
//  UIImage+Drop.swift
//  Drop
//
//  Created by hushaohua on 2018/2/4.
//  Copyright © 2018年 init. All rights reserved.
//

import UIKit

public extension UIImage{
    
    static func imageFrom(_ color:UIColor, size:CGSize) -> UIImage?{
        let rect = CGRect(origin:.zero, size:size);
        UIGraphicsBeginImageContextWithOptions(size, true, 0);
        color.setFill();
        UIRectFill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        return image;
    }
}
