//
//  ApodViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 19.04.2023.
//

import Foundation
import Alamofire

// MARK: - ApodResponseProtocol

protocol ApodResponseProtocol: AnyObject {
    func apodSuccess(apod: Apod)
    func apodFail(error: String)
}

class ApodViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: ApodResponseProtocol?

    // MARK: - Fetch Apod

    func fetchApod() {
        networkManager.request(router: .astronomyPictureOfTheDay) { [weak self] (result: Result<Apod, AFError>) in
            switch result {
            case .success(let apod):
                self?.delegate?.apodSuccess(apod: apod)
            case .failure(let error):
                self?.delegate?.apodFail(error: error.localizedDescription)
            }
        }
    }
}
