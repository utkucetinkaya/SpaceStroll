//
//  AppDelegate.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 22.10.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
     
        let splashViewController = SplashViewController()
        let navigationController = UINavigationController(rootViewController: splashViewController)
                
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    
        return true
    }
}
