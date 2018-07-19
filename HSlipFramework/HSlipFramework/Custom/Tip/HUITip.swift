//
//  HUITip.swift
//  Time
//
//  Created by hushaohua on 2017/4/27.
//  Copyright © 2017年 init. All rights reserved.
//

import UIKit

public class HUITip: NSObject {
    
    class HUITipView:UIView{
        lazy var textLabel:UILabel = {
            var label:UILabel = UILabel(frame: self.bounds);
            label.textAlignment = .center;
            label.textColor = UIColor.white;
            label.backgroundColor = UIColor(white: 0, alpha: 0.8);
            label.font = UIFont.systemFont(ofSize: 14, weight:.regular);
            label.autoresizingMask = [.flexibleWidth, .flexibleHeight];
            return label;
        }();
        override init(frame: CGRect) {
            super.init(frame: frame);
            self.addSubview(self.textLabel);
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    var tipView:HUITipView?;
    
    class Holder:NSObject {
        private static let holder:HUITip.Holder = HUITip.Holder();
        class var sharedHolder:HUITip.Holder {
            return holder;
        }
        
        var tip:HUITip?;
        func dismissDelayed(_ seconds:Int) -> Void {
            NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(dismissTip), object: nil);
            self.perform(#selector(dismissTip), with: nil, afterDelay: 1.5);
        }
        
        @objc func dismissTip() -> Void {
            UIView.animate(withDuration: 0.2, animations: {
                self.tip?.tipView?.alpha = 0;
            }, completion: { (success:Bool) in
                self.tip?.tipView?.removeFromSuperview();
                self.tip = nil;
            })
        }
        
        func showTip(_ tip:HUITip, delay seconds:Int) -> Void {
            self.tip = tip;
            self.dismissDelayed(seconds);
        }
    }
    
    class func showText(_ text:String) -> HUITip?{
        if text.count == 0 {
            return nil;
        }
        var tip:HUITip? = HUITip.Holder.sharedHolder.tip;
        if (tip == nil){
            tip = HUITip();
        }
        var view:HUITipView? = tip?.tipView;
        if (view == nil){
            view = HUITipView(frame: .zero);
        }
        view!.textLabel.text = text;
        let size:CGSize = view!.textLabel.sizeThatFits(UIScreen.main.bounds.size);
        view!.frame.size.width = size.width + 40;
        view!.frame.size.height = size.height + 20;
        view!.frame.origin.x = (UIScreen.main.bounds.size.width - size.width - 40) / 2;
        view!.frame.origin.y = (UIScreen.main.bounds.size.height - size.height - 20) / 2;
        view!.layer.masksToBounds = true;
        view!.layer.cornerRadius = 4;
        view!.alpha = 0;
        HUITip.topestVisibleFullWindow().addSubview(view!);
        UIView.animate(withDuration: 0.2, animations: { 
            view!.alpha = 1;
        }) { (success:Bool) in
            HUITip.Holder.sharedHolder.dismissDelayed(2);
        }
        
        tip!.tipView = view;
        HUITip.Holder.sharedHolder.tip = tip;
        return tip;
    }
    
    class func topestVisibleFullWindow() -> UIWindow{
        
        for window in UIApplication.shared.windows.reversed() {
            if !window.isHidden && window.frame.equalTo(UIScreen.main.bounds) {
                return window;
            }
        }
        return UIApplication.shared.keyWindow!;
    }
}
