//
//  UIColor+Extension.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 17.07.2023.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        var rgbValue: UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0xFF) / 255.0,
                  alpha: alpha)
    }
}
