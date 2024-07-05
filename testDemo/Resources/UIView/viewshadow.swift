//
//  viewshadow.swift
//  MAI
//
//  Created by Fluper on 24/11/17.
//  Copyright © 2017 Fluper. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func addShadowWithBlurOnView(_ view: UIView?,
                                      spread: CGFloat,
                                      blur: CGFloat,
                                      color: UIColor?,
                                      opacity: Float,
                                      OffsetX: CGFloat,
                                      OffsetY: CGFloat) {
       
       guard let view = view else { return  }
       
       view.layer.shadowOffset = CGSize(width: OffsetX, height: OffsetY)
       view.layer.shadowOpacity = opacity
       //Shadow Color
       if let shadowColor = color {
           view.layer.shadowColor = shadowColor.cgColor
       } else {
           view.layer.shadowColor = nil
       }
       //Shadow Blur
       view.layer.shadowRadius = blur / 2.0
       //Shadow Spread
       if spread == 0 {
           view.layer.shadowPath = nil
       } else {
           let dx = -spread
           let rect = view.bounds.insetBy(dx: dx, dy: dx)
           view.layer.shadowPath = UIBezierPath(rect: rect).cgPath
       }
       view.layer.masksToBounds = false
       view.clipsToBounds = false
   }
    
    func drawShadowwithCorner() {
        let layer = self.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0.2)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5
        layer.cornerRadius = 12
    }
    
    func addShadowOnSideViewInCell() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor(white: 0.0, alpha: 0.5).cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 6.0
    }
    
    func drawShadow(cornerRadius:CGFloat = 0) {
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = UIColor.darkGray.cgColor
        self.layer.shadowColor = UIColor.darkGray.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
        
    }
    
    func applyGradient(isTopBottom: Bool, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isTopBottom {
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //leftRight
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)// vertical gradient start
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func applyGradient(isTopBottom: Bool,cornerRadius: CGFloat, colorArray: [UIColor]) {
        if let sublayers = layer.sublayers {
            let _ = sublayers.filter({ $0 is CAGradientLayer }).map({ $0.removeFromSuperlayer() })
        }
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = "GradientLayer"
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        if isTopBottom {
            gradientLayer.locations = [0.0, 1.0]
        } else {
            //leftRight
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)// vertical gradient start
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        
        backgroundColor = .clear
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func removeGradientlayer() {
        guard let sublayers = self.layer.sublayers else {
            print("The view does not have any sublayers.")
            return
        }
        
        for layer in sublayers {
            if layer.name == "GradientLayer"{
                layer.removeFromSuperlayer()
            }
        }
    }
    
    func addShadowView(cornerRadius:CGFloat = 0) {
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 4.0
    }
    func drawBottomShadow() {
        let layer = self.layer
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5, height: 5);
        layer.shadowOpacity = 0.4;
        layer.shadowRadius = 2.0;
        layer.masksToBounds = false
    }
    
    func overShape() {
        let path = UIBezierPath(ovalIn: self.bounds)
            let maskLayer = CAShapeLayer()
            maskLayer.path = path.cgPath
            self.layer.mask = maskLayer
    }
    
    func setGradientBackground(colorTop:UIColor , colorBottom:UIColor) {
        let gradientLayer = CAGradientLayer()
        //gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        self.layer.insertSublayer(gradientLayer, at:1)    }
    
    func drawShadowOnCell() {
        let layer = self.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 1, height: 0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 3
    }
    func drawBottomShadows() {
          let layer = self.layer
          layer.shadowColor = UIColor.gray.cgColor
          layer.shadowOffset = CGSize(width: 5, height: 5);
          layer.shadowOpacity = 0.4;
          layer.shadowRadius = 2.0;
          layer.masksToBounds = false
      }
    
    @IBInspectable
    var cornerRadius1: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable
    var borderWidth1: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor1: UIColor? {
        get {
            let color = UIColor(cgColor: layer.borderColor!)
            return color
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius1: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowColor = UIColor.lightGray.cgColor
            layer.shadowOffset = CGSize(width: 0, height: 2)
            layer.shadowOpacity = 0.9
            layer.shadowRadius = shadowRadius1
        }
    }
    
        @discardableResult
        func applyStyle(cornerRadius: CGFloat, backgroundColor: UIColor) -> Self {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = true
            self.backgroundColor = backgroundColor
            return self
        }
  
    @discardableResult
    func applyStyle1(cornerRadius: CGFloat, backgroundColor: UIColor,borderWidth: CGFloat,borderColor: UIColor) -> Self {
        layer.cornerRadius = cornerRadius
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
        layer.masksToBounds = true
        self.backgroundColor = backgroundColor
        return self
    }
    
}

extension UIButton {
    
    func drawShadowOnButton(cornerRadius:CGFloat = 20) {
        let layer = self.layer
        layer.shadowColor = UIColor.black.cgColor
        layer.borderWidth = 0.5
        layer.borderColor = #colorLiteral(red: 0.7233634591, green: 0.7233806252, blue: 0.7233713269, alpha: 0)
        layer.cornerRadius = 2
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 2, height: 2)
    }
 
    
}

extension UIImageView {
    
    func drawShadowOnImage() {
        self.layer.cornerRadius = 7
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 6.0
    }
    
}

extension UICollectionViewCell {
    
    func drawSadowOncollectionViewCell() {
        self.contentView.layer.cornerRadius = 12.0
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width:0,height: 1.0)
        self.layer.shadowRadius = 2.0
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }
    
}

extension UIView {
    
    //MARK: - Round corner method
    func maskingCorner(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
