//
//  SplashViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 22.10.2022.
//

import UIKit
import Lottie

final class SplashViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var cardView: CardView!
    @IBOutlet fileprivate weak var topAnimationView: LottieAnimationView!
    @IBOutlet fileprivate weak var bottomAnimationView: LottieAnimationView!
    @IBOutlet fileprivate weak var welcomeLabel: UILabel!
    
    
    // MARK: - Variables
    
    let lastViewedKey = "lastViewed"
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        goToHomeScreen()
        setWelcomeText()
        setupAnimationView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UserDefaults.standard.set(Date(), forKey: lastViewedKey)
    }
    
    //MARK: - Functions

    private func goToHomeScreen() {

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showTabBarController()
        }
    }
    
    func showTabBarController() {
        let tabBarController = MyCustomTabBarController()
        self.navigationController?.setViewControllers([tabBarController], animated: true)
    }
    
    private func setWelcomeText() {
         if UserDefaults.standard.object(forKey: lastViewedKey) is Date {
                // Eğer son görüntüleme tarihi kaydedilmişse
                welcomeLabel.text = "Hello!"
            } else {
                // Eğer son görüntüleme tarihi kaydedilmemişse
                welcomeLabel.text = "Welcome"
         }
     }
    
    private func setupAnimationView() {
        // Top animation view setup
        topAnimationView.frame = view.bounds
        topAnimationView.contentMode = .scaleAspectFit
        topAnimationView.loopMode = .loop
        topAnimationView.animationSpeed = 1.0
        topAnimationView.play()
        
        // Bottom animation view setup
        bottomAnimationView.frame = view.bounds
        bottomAnimationView.contentMode = .scaleAspectFit
        bottomAnimationView.loopMode = .loop
        bottomAnimationView.animationSpeed = 1.0
        bottomAnimationView.play()
    }
}
