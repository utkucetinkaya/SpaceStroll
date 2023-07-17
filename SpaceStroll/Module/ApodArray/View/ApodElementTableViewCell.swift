//
//  ApodElementTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 4.07.2023.
//

import UIKit
import Kingfisher

class ApodElementTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var copyright: UILabel!
    @IBOutlet fileprivate weak var descLabel: UILabel!
    @IBOutlet fileprivate weak var ApodElementImageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    
    // MARK: - SetCell
    
    func setCell(apodElement: ApodElement) {
        copyright.text = apodElement.copyright
        descLabel.text = apodElement.explanation
        
        ApodElementImageView.kf.indicatorType = .activity
        ApodElementImageView.kf.indicator?.view.backgroundColor = .systemBackground
        ApodElementImageView.kf.indicator?.view.layer.cornerRadius = 6
        ApodElementImageView.kf.setImage(
            with: apodElement.hdurl?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
        
        titleLabel.text = apodElement.title
        titleLabel.addShadow()
        dateLabel.text = apodElement.date
        descLabel.addShadow()
    }
}
