//
//  Gradient.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/10.
//

import UIKit

@IBDesignable
final class GradientView: UIView {
    
    @IBInspectable var Color1: UIColor = UIColor.orange
    @IBInspectable var Color2: UIColor = UIColor.red
    
    @IBInspectable var Position1: CGPoint = CGPoint.init(x: 0, y: 1)
    @IBInspectable var Position2: CGPoint = CGPoint.init(x: 1, y: 0)
    
    override func draw(_ rect: CGRect) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        
        let color1 = Color1.cgColor
        let color2 = Color2.cgColor
        
        gradientLayer.colors = [color1, color2]
        
        gradientLayer.startPoint = Position1
        gradientLayer.endPoint = Position2
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

@IBDesignable
final class DesignableButton: UIButton {
    @IBInspectable var CornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
