//
//  UIView+Extensions.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 27.05.2023.
//

import Foundation
import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return self.cornerRadius}
        set{
            self.layer.cornerRadius = newValue
        }
    }
}
