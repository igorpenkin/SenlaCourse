//
//  UIView+Extension.swift
//  SenlaApp
//
//  Created by Igor Penkin on 16.04.2022.
//

import UIKit

extension UIView {
    
    func animationOfTouchDown() {
        let touchDown = CASpringAnimation(keyPath: "transform.scale")
        touchDown.duration = 0.4
        touchDown.fromValue = 1
        touchDown.toValue = 0.8
        touchDown.autoreverses = false
        touchDown.initialVelocity = 20
        touchDown.damping = 10
        touchDown.isRemovedOnCompletion = false
        touchDown.fillMode = .forwards
        layer.add(touchDown, forKey: nil)
    }
    
    func animationOfTouchUp() {
        let touchDown = CASpringAnimation(keyPath: "transform.scale")
        touchDown.duration = 0.4
        touchDown.fromValue = 1
        touchDown.toValue = 1
        touchDown.autoreverses = false
        touchDown.initialVelocity = 20
        touchDown.damping = 10
        touchDown.isRemovedOnCompletion = false
        touchDown.fillMode = .forwards
        layer.add(touchDown, forKey: nil)
    }
 
    func setGradientBackground(fromColor: UIColor, toColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}


extension UIView {
    
    var width: CGFloat {
        return frame.size.width
    }
    
    var height: CGFloat {
        return frame.size.height
    }
    
    var left: CGFloat {
        return frame.origin.x
    }
    
    var right: CGFloat {
        return left + width
    }
    
    var top: CGFloat {
        return frame.origin.y
    }
    
    var bottom: CGFloat {
        return top + height
    }
}
