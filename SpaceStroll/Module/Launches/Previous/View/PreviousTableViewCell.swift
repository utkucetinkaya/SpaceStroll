//
//  PreviousTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import UIKit
import Kingfisher

class PreviousTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var previousNameLabel: UILabel!
    @IBOutlet fileprivate weak var previousImageView: UIImageView!
    @IBOutlet fileprivate weak var locationLabel: UILabel!
    @IBOutlet fileprivate weak var netPrecisionLabel: UILabel!
    @IBOutlet fileprivate weak var abbrevLabel: UILabel!
    @IBOutlet fileprivate weak var abbrevView: UIView!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    
    // MARK: - SetCell

    func setCell(previous: Previous) {
        previousNameLabel.text = previous.name
        previousImageView.kf.setImage(with: previous.image?.asURL)
        locationLabel.text = previous.location
        netPrecisionLabel.text = previous.lspName
        dateLabel.text = Date.formattedDateFromString(dateString: previous.net ?? "")
        abbrevLabel.text = previous.status?.abbrev

        // abbrev view
        if let statusAbbreviation = previous.status?.abbrev {
            switch statusAbbreviation {
            case "Success":
                abbrevView.backgroundColor = UIColor.green
            default:
                abbrevView.backgroundColor = UIColor.red
            }
        }
    }
}
