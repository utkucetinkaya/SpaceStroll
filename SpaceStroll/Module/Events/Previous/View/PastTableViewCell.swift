//
//  PastTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import UIKit
import Kingfisher

class PastTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var descLabel: UILabel!
    @IBOutlet fileprivate weak var locationLabel: UILabel!
    @IBOutlet fileprivate weak var pastEventsImageView: UIImageView!
    
    // MARK: - SetCell
    
    func setCell(pastEvents: Past) {
        nameLabel.text = pastEvents.name
        descLabel.text = pastEvents.description
        locationLabel.text = pastEvents.location
        
        pastEventsImageView.kf.indicatorType = .activity
        pastEventsImageView.kf.indicator?.view.backgroundColor = .systemBackground
        pastEventsImageView.kf.indicator?.view.layer.cornerRadius = 6
        pastEventsImageView.kf.setImage(
            with: pastEvents.featureImage?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
        
        dateLabel.text = Date.formattedDateFromString(dateString: (pastEvents.date) ?? "")
    }
}
