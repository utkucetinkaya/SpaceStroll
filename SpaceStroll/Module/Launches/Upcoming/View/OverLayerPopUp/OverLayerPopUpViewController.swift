//
//  OverLayerPopUpViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.07.2023.
//

import UIKit

final class OverLayerPopUpViewController: UIViewController {
  
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var backView: UIView!
    @IBOutlet fileprivate weak var contentView: UIView!
    
    // MARK: - init

    init() {
        super.init(nibName: "OverLayerPopUpViewController", bundle: nil)
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configView()
    }
    // MARK: - IBAction

    @IBAction func doneAction(_ sender: UIButton) {
        hide()
    }
    
    // MARK: - Function

   private func configView() {
        self.view.backgroundColor = .clear
        self.backView.backgroundColor = .black.withAlphaComponent(0.6)
        self.backView.alpha = 0
        self.contentView.alpha = 0
        self.contentView.layer.cornerRadius = 10
    }
    
    func appear(sender: UIViewController) {
        sender.present(self, animated: false) {
            self.show()
        }
    }
    private func show() {
        UIView.animate(withDuration: 1, delay: 0.1) {
            self.backView.alpha = 1
            self.contentView.alpha = 1
        }
    }
    
    private func hide() {
        UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseOut) {
            self.backView.alpha = 0
            self.contentView.alpha = 0
        } completion: { _ in
            self.dismiss(animated: false)
            self.removeFromParent()
        }
    }
}
