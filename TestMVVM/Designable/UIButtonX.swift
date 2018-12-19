//
//  UIButtonX.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

@objc @IBDesignable class UIButtonX: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var cornerRadiusPercentageInWidth: CGFloat = 0.0 {
        didSet {
            let radius = self.frame.size.width
            self.layer.cornerRadius = cornerRadiusPercentageInWidth * radius
        }
    }
    
    @IBInspectable var cornerRadiusPercentageInHeight: CGFloat = 0.0 {
        didSet {
            let radius = self.frame.size.height
            self.layer.cornerRadius = cornerRadiusPercentageInHeight * radius
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadowOpacity
        }
    }
    
    /// The shadow offset. Defaults to (0, -3). Animatable.
    @IBInspectable var shadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var adjustsFontWidth: Bool = false {
        didSet {
            self.titleLabel?.adjustsFontSizeToFitWidth = adjustsFontWidth
        }
    }
    
    @IBInspectable var minScaleFactor: CGFloat = 0.0 {
        didSet {
            self.titleLabel?.minimumScaleFactor = minScaleFactor
        }
    }
}
