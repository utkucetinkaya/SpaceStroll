//
//  MarsPhotoCollectionViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 7.07.2023.
//

import UIKit
import Kingfisher

class MarsPhotoCollectionViewCell: UICollectionViewCell {
    
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var photoImageView: UIImageView!
        
    // MARK: - SetCell
    
    func setCell(photoModel: LatestPhoto) {
        photoImageView.kf.setImage(with: photoModel.imgSrc?.asURL)
    }
}
