//
//  UIViewController+Keyboard.swift
//  Drop
//
//  Created by hushaohua on 2018/1/23.
//  Copyright © 2018年 init. All rights reserved.
//

import UIKit

public class HTapGestureRecognizer: UITapGestureRecognizer {
    var h_target: Any?;
    var h_action: Selector?;
    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action);
        self.h_target = target;
        self.h_action = action;
    }
}

public extension UIView{
    
    func getTapToDismissKeyboardGesture() -> HTapGestureRecognizer? {
        if (self.gestureRecognizers != nil && self.gestureRecognizers!.count > 0){
            for gesture in self.gestureRecognizers! {
                if gesture is HTapGestureRecognizer {
                    let tap:HTapGestureRecognizer = gesture as! HTapGestureRecognizer;
                    if (tap.h_target is UIViewController && tap.h_action == #selector(dismissKeyboard)){
                        return tap;
                    }
                }
            }
        }
        return nil;
    }
    
    func enableTapToDismissKeyboard(_ delegate:UIGestureRecognizerDelegate?) -> Void {
        var tap:HTapGestureRecognizer? = self.getTapToDismissKeyboardGesture();
        if (tap == nil){
            tap = HTapGestureRecognizer(target: self, action: #selector(dismissKeyboard));
            if (delegate != nil){
                tap?.delegate = delegate!;
            }
            self.addGestureRecognizer(tap!);
        }else{
            tap?.isEnabled = true;
        }
    }
    
    func disableTapToDismissKeyboard() -> Void{
        if (self.gestureRecognizers != nil && self.gestureRecognizers!.count > 0){
            for gesture in self.gestureRecognizers! {
                if gesture is HTapGestureRecognizer {
                    let tap:HTapGestureRecognizer = gesture as! HTapGestureRecognizer;
                    if (tap.h_target is UIViewController && tap.h_action == #selector(dismissKeyboard)){
                        tap.isEnabled = true;
                    }
                }
            }
        }
    }
    
    @objc func dismissKeyboard(){
        self.endEditing(true);
    }
}
