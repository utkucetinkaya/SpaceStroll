//
//  GradientBackgroundView.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 29.05.2023.
//

import Foundation
import UIKit

@IBDesignable class GradientBackgroundView: UIView {
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }

    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }

    @IBInspectable var startColor: UIColor? {
         didSet { gradientLayer.colors = cgColorGradient }
     }

     @IBInspectable var endColor: UIColor? {
         didSet { gradientLayer.colors = cgColorGradient }
     }

     @IBInspectable var startPoint: CGPoint = CGPoint(x: 0.0, y: 0.0) {
         didSet { gradientLayer.startPoint = startPoint }
     }

     @IBInspectable var endPoint: CGPoint = CGPoint(x: 1.0, y: 1.0) {
         didSet { gradientLayer.endPoint = endPoint }
     }


}

extension GradientBackgroundView {
   
    internal var cgColorGradient: [CGColor]? {
        guard let startColor = startColor, let endColor = endColor else {
            return nil
        }

        return [startColor.cgColor, endColor.cgColor]
    }
}
