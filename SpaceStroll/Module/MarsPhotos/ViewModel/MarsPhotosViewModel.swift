//
//  MarsPhotosViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 6.07.2023.
//

import Foundation
import Alamofire

// MARK: - LatestPhotoResponseProtocol

protocol LatestPhotoResponseProtocol: AnyObject {
    func latestPhotoSuccess(latestPhoto: [LatestPhoto])
    func latestPhotoFail(error: String)
}

class MarsPhotosViewModel {
    
    // MARK: - Properties

    private let networkManager = NetworkManager.shared
    weak var delegate: LatestPhotoResponseProtocol?

    // MARK: - FetchLatestPhoto

    func FetchLatestPhoto() {
        networkManager.request(router: .marsPhotos) { [weak self] (result: Result<MarsPhotos, AFError>) in
            switch result {
            case .success(let latestPhoto):
                self?.delegate?.latestPhotoSuccess(latestPhoto: latestPhoto.latestPhotos)

            case .failure(let error):
                self?.delegate?.latestPhotoFail(error: error.localizedDescription)
            }
        }
    }
}
