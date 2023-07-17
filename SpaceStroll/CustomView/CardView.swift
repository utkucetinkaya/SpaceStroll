//
//  CardView.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 27.05.2023.
//

import UIKit
class CardView: UIView {
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    // MARK: - Function

    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 2)
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 10
    }
}
