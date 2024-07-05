//
//  UIViewBorderWidthAndColor.swift
//  TheBeaconApp
//
//  Created by Ruchin Singhal on 04/11/16.
//  Copyright © 2016 finoit. All rights reserved.
//

import UIKit

class UIViewBorderWidthAndColor: UIView {
    @IBInspectable  override var borderWidth1: CGFloat {
        didSet {
            layer.borderWidth = borderWidth1
        }
    }
    @IBInspectable override  var borderColor1: UIColor? {
        didSet {
            layer.borderColor = borderColor1?.cgColor
        }
    }
}

extension UIView {

    enum ViewSide {
        case Left, Right, Top, Bottom
    }

    func addBorder(toSide side: ViewSide, withColor color: CGColor, andThickness thickness: CGFloat) {

        let border = CALayer()
        border.backgroundColor = color

        switch side {
        case .Left: border.frame = CGRect(x: frame.minX, y: frame.minY, width: thickness, height: frame.height); break
        case .Right: border.frame = CGRect(x: frame.maxX, y: frame.minY, width: thickness, height: frame.height); break
        case .Top: border.frame = CGRect(x: frame.minX, y: frame.minY, width: frame.width, height: thickness); break
        case .Bottom: border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: thickness); break
        }

        layer.addSublayer(border)
    }
    
}


/*Gradient Color*/
extension UIView {
    @discardableResult
    func applyGradient(colours: [UIColor], cornerradius: CGFloat) -> CAGradientLayer {
        return self.applyGradient(colours: colours, locations: nil, cornerRadius: cornerradius)
    }

    func removeGradient() {
        for layer in self.layer.sublayers ?? []{
            if layer.isKind(of:CAGradientLayer.self){
                layer.removeFromSuperlayer()
            }
        }
    }
    
    
    @discardableResult
    func applyGradient(colours: [UIColor], locations: [NSNumber]?, cornerRadius: CGFloat) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradient.cornerRadius = cornerRadius
        return gradient
    }
}
/*Corner Radius*/
extension UIView {
    
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let maskLayer = CAShapeLayer()
            maskLayer.frame = self.bounds
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
        }
    }
}
