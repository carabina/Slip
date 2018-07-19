//
//  UIAlertController+HShare.swift
//  Drop
//
//  Created by hushaohua on 2017/12/20.
//  Copyright © 2017年 init. All rights reserved.
//

import Foundation
import UIKit

public extension UIAlertController{
    
    convenience init(_ title:String, message:String) {
        self.init(title: title, message: message, preferredStyle: .alert);
    }
    
    public static func standardAlert(_ title:String, message:String, okAction:(() -> Void)?) -> UIAlertController{
        let alert:UIAlertController = UIAlertController(title, message:message);
        alert.addStandardActions(ok: okAction, cancel: nil);
        return alert;
    }
    
    public static func standardAlert(_ title:String, message:String, okAction:(() -> Void)?, cancelAction:(() -> Void)?) -> UIAlertController{
        let alert:UIAlertController = UIAlertController(title, message:message);
        alert.addStandardActions(ok:okAction, cancel: cancelAction);
        return alert;
    }
    
    func show() -> Void {
        let delegate = UIApplication.shared.delegate;
        if (delegate?.window != nil){
            let window = (delegate!).window!;
            window?.rootViewController?.present(self, animated: true, completion: nil);
        }
        
//        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: true, completion: nil);
    }
    
    func dismiss() -> Void {
        self.dismiss(animated: true, completion: nil);
    }
    
    func addStandardActions(ok:(() -> Void)?, cancel:(() -> Void)?) -> Void {
        let cancelAction:UIAlertAction = UIAlertAction(title: "取消", style: .cancel) { (action) in
            if (cancel != nil){
                cancel!();
            }
        };
        let okAction:UIAlertAction = UIAlertAction(title: "确定", style: .default) { (action) in
            if (ok != nil){
                ok!();
            }
        };
        self.addAction(cancelAction);
        self.addAction(okAction);
    }
    
}
