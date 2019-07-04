//
//  UIViewExtension.swift
//  Trivia
//
//  Created by Shoaib Ismail on 13/06/2019.
//  Copyright © 2019 Emblem Technologies. All rights reserved.
//

import UIKit

extension UIView{
    
    func layoutIfNeededWithAnimation(duration: TimeInterval?){
        UIView.animate(withDuration: duration ?? 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    func getConstriant(identifier: String) -> NSLayoutConstraint?{
        for constraint in self.constraints {
            if constraint.identifier == identifier{
                return constraint
            }
        }
        return nil
    }
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var circle: Bool{
        get{
            return false
        }
        set{
            if newValue{
                layer.cornerRadius = frame.width*0.5
                layer.masksToBounds = true
            }
            
        }
    }
    
    // MARK: - Shadow
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    func fadeIn(duration: TimeInterval = 0.3){
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
    
    func fadeOut(duration: TimeInterval = 0.3){
        UIView.animate(withDuration: duration) {
            self.alpha = 0
        }
    }
    
//    func transform(translationX: CGFloat, y: CGFloat, duration: TimeInterval = 0.3){
//        UIView.animate(withDuration: duration) {
//            self.transform = CGAffineTransform(translationX: translationX, y: y)
//        }
//    }
    
    func transform(translationX: CGFloat, y: CGFloat, duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: ((Bool) -> Void)? = nil){
        UIView.animate(withDuration: duration, delay: delay, options: [ .curveEaseOut ], animations: {
            self.transform = CGAffineTransform(translationX: translationX, y: y)
        }, completion: completion)
    }
}
