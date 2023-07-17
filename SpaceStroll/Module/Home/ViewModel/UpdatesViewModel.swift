//
//  UpdatesViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 22.06.2023.
//

import Foundation
import Alamofire

// MARK: - UpdatesResponseProtocol

protocol UpdatesResponseProtocol: AnyObject {
    func updatesSuccess(updates: [Updates])
    func updatesFail(error: String)
}

class UpdatesViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: UpdatesResponseProtocol?

    // MARK: - Fetch Updates

    func fetchUpdates() {
        networkManager.request(router: .updates) { [weak self] (result: Result<SpaceUpdates, AFError>) in
            switch result {
            case .success(let updates):
                self?.delegate?.updatesSuccess(updates: updates.results)
            case .failure(let error):
                self?.delegate?.updatesFail(error: error.localizedDescription)
            }
        }
    }
}
