//
//  Gradient.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/10.
//

import UIKit

@IBDesignable
final class GradientView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    @IBInspectable var CornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
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
}
