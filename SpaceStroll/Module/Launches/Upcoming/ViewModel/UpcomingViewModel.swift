//
//  UpcomingViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 23.06.2023.
//

import Foundation
import Alamofire

// MARK: - UpcomingResponseProtocol

protocol UpcomingResponseProtocol: AnyObject {
    func upcomingSuccess(upcoming: [Upcoming])
    func upcomingFail(error: String)
}

class UpcomingViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: UpcomingResponseProtocol?

    // MARK: - Fetch Upcoming

    func fetchUpcoming() {
        networkManager.request(router: .upcomingLaunches) { [weak self] (result: Result<UpcomingLaunches, AFError>) in
            switch result {
            case .success(let upcoming):
                self?.delegate?.upcomingSuccess(upcoming: upcoming.results)

            case .failure(let error):
                self?.delegate?.upcomingFail(error: error.localizedDescription)
            }
        }
    }
}
