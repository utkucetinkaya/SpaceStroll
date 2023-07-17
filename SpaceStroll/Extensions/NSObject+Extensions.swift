//
//  NSObject+Extensions.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 22.10.2022.
//

import Foundation

extension NSObject {
    class var nameOfClass: String {
        return String(describing: self)
    }
}
