//
//  UpdatesTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 22.06.2023.
//

import UIKit
import Kingfisher

class UpdatesTableViewCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var commentLabel: UILabel!
    @IBOutlet fileprivate weak var createdByLabel: UILabel!
    @IBOutlet fileprivate weak var updatesImageView: UIImageView!
    
    @IBAction func infoUrl(_ sender: UIButton) {
   
    }
    // MARK: - SetCell
    
    func setCell(updates: Updates) {
        
        commentLabel.text = updates.comment
        createdByLabel.text = updates.createdBy

        if let publishedDate = Date.formattedDate(from: updates.createdOn ?? "") {
            let pastTime = publishedDate.getPastTime()
            dateLabel.text = pastTime
        }
        updatesImageView.kf.setImage(with: updates.profileImage?.asURL)
    }
}
