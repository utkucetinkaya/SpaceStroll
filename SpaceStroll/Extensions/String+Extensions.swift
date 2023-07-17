//
//  String+Extensions.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 27.05.2023.
//

import Foundation

extension String {
    var asURL: URL? {
        return URL(string: self)
    }
}
