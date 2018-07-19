//
//  UIView+CA.swift
//  Drop
//
//  Created by hushaohua on 2018/2/12.
//  Copyright © 2018年 init. All rights reserved.
//

import QuartzCore

public extension CALayer{
    func addShakeOnHorizontal() -> String{
        self.removeAnimation(forKey: "shake_h");
        let position = self.position;
        let leftPoint = CGPoint(x:position.x - 10, y:position.y);
        let rightPoint = CGPoint(x:position.x + 10, y:position.y);
        let animation = CABasicAnimation(keyPath: "position");
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault);
        animation.fromValue =  rightPoint;
        animation.toValue = leftPoint;
        animation.autoreverses = true;
        animation.duration = 0.04;
        animation.repeatCount = 2;
        self.add(animation, forKey: "shake_h");
        return "shake_h";
    }
}
