//
//  OverlayView.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 30.05.2023.
//

import UIKit
import Kingfisher

class OverlayView: UIViewController {
    
    // MARK: - Variables
    
    var hasSetPointOrigin = false
    var pointOrigin: CGPoint?
    var apod: Apod?
    var apodViewModel = ApodViewModel()

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var apodImageView: UIImageView!
    @IBOutlet fileprivate weak var descLabel: UILabel!
    
    // MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizerAction))
        view.addGestureRecognizer(panGesture)
        registerViewModel()
    }
    
    // MARK: - ViewDidLayout
    
    override func viewDidLayoutSubviews() {
        if !hasSetPointOrigin {
            hasSetPointOrigin = true
            pointOrigin = self.view.frame.origin
        }
    }
    
    private func registerViewModel() {
        apodViewModel.delegate = self
        apodViewModel.fetchApod()
    }
    
   private func setApodUI(apod: Apod) {
       titleLabel.text = apod.title
       descLabel.text = apod.explanation
       apodImageView.kf.setImage(with: apod.hdurl?.asURL)
       
       // Minimum height value for the UIImageView
       let minHeight: CGFloat = 120

       // Create a constraint for the heightAnchor
       let heightConstraint = apodImageView.heightAnchor.constraint(greaterThanOrEqualToConstant: minHeight)

       // Activate the constraint
       heightConstraint.isActive = true
    }
    
    // MARK: - PanGestureRecognizer
    
    @objc func panGestureRecognizerAction(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        // Not allowing the user to drag the view upward
        guard translation.y >= 0 else { return }
        
        // setting x as 0 because we don't want users to move the frame side ways!! Only want straight up or down
        view.frame.origin = CGPoint(x: 0, y: self.pointOrigin!.y + translation.y)
        
        if sender.state == .ended {
            let dragVelocity = sender.velocity(in: view)
            if dragVelocity.y >= 1300 {
                self.dismiss(animated: true, completion: nil)
            } else {
                // Set back to original position of the view controller
                UIView.animate(withDuration: 0.3) {
                    self.view.frame.origin = self.pointOrigin ?? CGPoint(x: 0, y: 400)
                }
            }
        }
    }
}

extension OverlayView: ApodResponseProtocol {
    func apodSuccess(apod: Apod) {
        setApodUI(apod: apod)
    }
    
    func apodFail(error: String) {
        print(error)
    }
}
