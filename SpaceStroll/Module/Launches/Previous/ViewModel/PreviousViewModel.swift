//
//  PreviousViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation
import Alamofire

// MARK: - PreviousResponseProtocol

protocol PreviousResponseProtocol: AnyObject {
    func previousSuccess(previous: [Previous])
    func previousFail(error: String)
}

class PreviousViewModel {
    
    // MARK: - Properties

    private let networkManager = NetworkManager.shared
    weak var delegate: PreviousResponseProtocol?

    // MARK: - Fetch Previous

    func fetchPrevious() {
        networkManager.request(router: .previousLaunches) { [weak self] (result: Result<PreviousLaunches, AFError>) in
            switch result {
            case .success(let previous):
                self?.delegate?.previousSuccess(previous: previous.results)

            case .failure(let error):
                self?.delegate?.previousFail(error: error.localizedDescription)
            }
        }
    }
}
