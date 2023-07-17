//
//  HomeCollectionViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 30.05.2023.
//

import UIKit
import Kingfisher

class ExploreCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var exploreImageView: UIImageView!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    
    // MARK: - SetCell
    
    func setCell(explore: ExploreModel) {
        exploreImageView.kf.setImage(with: explore.image?.asURL)
        nameLabel.text = explore.name
        nameLabel.addShadow()
    }
}
