//
//  PastEventsViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation
import Alamofire

// MARK: - PastEventsResponseProtocol

protocol PastEventsResponseProtocol: AnyObject {
    func pastEventsSuccess(pastEvents: [Past])
    func pastEventsFail(error: String)
}

class PastEventsViewModel {
    
    // MARK: - Properties

    private let networkManager = NetworkManager.shared
    weak var delegate: PastEventsResponseProtocol?

    // MARK: - FetchPastEvents

    func fetchPastEvents() {
        networkManager.request(router: .previousEvents) { [weak self] (result: Result<PreviousEvents, AFError>) in
            switch result {
            case .success(let pastEvents):
                self?.delegate?.pastEventsSuccess(pastEvents: pastEvents.results)

            case .failure(let error):
                self?.delegate?.pastEventsFail(error: error.localizedDescription)
            }
        }
    }
}
