//
//  CustomProgressBar.swift
//  CustomProgressBarSample
//
//  Created by Shoaib Ismail on 02/07/2019.
//  Copyright © 2019 Emblem Technologies. All rights reserved.
//

import Foundation
import UIKit

public class CustomProgressbar: UIView {
    
    let kCONTENT_XIB_NAME = "ProgressBarView"
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var innerBar: UIView!
    @IBOutlet weak var middleBar: UIView!
    @IBOutlet weak var outerBar: UIView!
    
    @IBOutlet weak var innerBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var middleBarWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var outterBarWidthConstraint: NSLayoutConstraint!
    
    
    var barWidth: CGFloat!
    
    var totalTimeToAnimate: Double! // in miliseconds
    var decraseWithAfterTime: Double!
    var timer = Timer()
    
    var actualViewWidth: CGFloat!
    
    public var stopInnerBar = false
    public var stopMiddleBar = false
    public var stopOutterBar = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
        barWidth = innerBar.frame.width
    }
    
    public func setBackgroundColorsFor(innerBar: UIColor, middleBar: UIColor, outterBar: UIColor){
        self.innerBar.backgroundColor = innerBar
        self.middleBar.backgroundColor = middleBar
        self.outerBar.backgroundColor = outterBar
    }
    
    public func setTimer(_ time: Double){
        self.totalTimeToAnimate = time
        self.decraseWithAfterTime = time / Double(barWidth)
    }
    
    public func startAnimation(){
        actualViewWidth = outterBarWidthConstraint.constant
        timer = Timer.scheduledTimer(timeInterval: decraseWithAfterTime, target: self, selector: #selector(reduceWidth), userInfo: nil, repeats: true)
    }
    
    @objc private func reduceWidth(){
        if !stopOutterBar{
            outterBarWidthConstraint.constant = outterBarWidthConstraint.constant - 1
        }
        if !stopMiddleBar {
            middleBarWidthConstraint.constant = middleBarWidthConstraint.constant - 1
        }
        if !stopInnerBar {
            innerBarWidthConstraint.constant = innerBarWidthConstraint.constant - 1
        }
    }
}


extension CustomProgressbar {
    public func resetViews(){
        timer.invalidate()
        if let barWidth = barWidth {
            outterBarWidthConstraint.constant = barWidth
            middleBarWidthConstraint.constant = barWidth
            innerBarWidthConstraint.constant = barWidth
        }
    }
}


extension UIView{
    func fixInView(_ container: UIView!){
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}


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
    
    func transform(translationX: CGFloat, y: CGFloat, duration: TimeInterval = 0.3, delay: TimeInterval = 0, completion: ((Bool) -> Void)? = nil){
        UIView.animate(withDuration: duration, delay: delay, options: [ .curveEaseOut ], animations: {
            self.transform = CGAffineTransform(translationX: translationX, y: y)
        }, completion: completion)
    }
}
