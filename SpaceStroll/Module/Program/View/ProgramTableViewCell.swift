//
//  ProgramTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 29.06.2023.
//

import UIKit
import Kingfisher

class ProgramTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var descLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var programImageView: UIImageView!
    
    // MARK: - SetCell

    func setCell(program: Program){
        nameLabel.text = program.name
        descLabel.text = program.description
        
        programImageView.kf.indicatorType = .activity
        programImageView.kf.indicator?.view.backgroundColor = .systemBackground
        programImageView.kf.indicator?.view.layer.cornerRadius = 6
        programImageView.kf.setImage(
            with: program.imageURL?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
    }
}
