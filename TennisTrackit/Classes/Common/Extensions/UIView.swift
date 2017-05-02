//
//  UIView.swift
//  App
//
//  Copyright © 2015. All rights reserved.
//

import Foundation
import UIKit
import Cartography

extension UIView {
    
    // MARK: - UIView
    
    static func viewWithDerivedNibName() -> UIView {
        
        let view = Bundle.main.loadNibNamed(self.className(), owner:nil, options:nil)![0] as! UIView
        
        assert(type(of: view).className() == self.className(), "XIB root view needs to be of type \(self.className())")
        
        return view
    }
    
    static func nib() -> UINib {
        
        return UINib(nibName: self.className(), bundle: nil)
    }
    
    static func reuseIdentifier() -> String {
        
        return self.className()
    }
    
    func closestSuperviewWithClassName(className: String) -> UIView? {
        
        var view = superview
        while nil != view && false == view!.isKind(of: NSClassFromString(className)!) {
            view = view?.superview
        }
        
        if nil != view && true == view!.isKind(of: NSClassFromString(className)!) {
            return view!
        }
        
        return nil
    }
    
    func addView(view: UIView) {
        addSubview(view)
        
        constrain(view, self) { childView, view in
            childView.size == view.size
            childView.center == view.center
        }
    }
    
    func pulseWithDuration(duration: Double) {
        let pulseAnimation:CABasicAnimation = CABasicAnimation(keyPath: "opacity")
        pulseAnimation.duration = duration
        pulseAnimation.fromValue = NSNumber(value: 0.0)
        pulseAnimation.toValue = NSNumber(value: 1.0)
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = FLT_MAX
        layer.add(pulseAnimation, forKey: "animateOpacity")
    }
}
