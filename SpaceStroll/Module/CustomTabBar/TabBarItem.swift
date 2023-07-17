//
//  TabBarItem.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 21.06.2023.
//

import Foundation
import UIKit

enum TabBarItem: String, CaseIterable {
    case home = "Home"
    case explore = "Explore"
    
    var title: String {
        return self.rawValue
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(systemName: "house")!
        case .explore:
            return UIImage(systemName: "binoculars.fill")!
        }
    }
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeViewController()
        case .explore:
            return ExploreViewController()
        }
    }
}
