//
//  UIVIew+Super.swift
//  Drop
//
//  Created by hushaohua on 2018/4/30.
//  Copyright © 2018年 init. All rights reserved.
//

import UIKit

public extension UIView{
    
    func superTableViewCell() -> UITableViewCell? {
        if self is UITableViewCell {
            return self as? UITableViewCell;
        }
        return self.superview?.superTableViewCell();
    }
    
}
