//
//  UILabel+Extension.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 17.07.2023.
//

import Foundation
import UIKit

extension UILabel {
    func addShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 3
        layer.shadowOpacity = 2
        layer.masksToBounds = false
        layer.shouldRasterize = true
    }
}
