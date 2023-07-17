//
//  UpcomingEventsViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation
import Alamofire

// MARK: - UpcomingEventsResponseProtocol

protocol UpcomingEventsResponseProtocol: AnyObject {
    func upcomingEventsSuccess(events: [Events])
    func upcomingEventsFail(error: String)
}

class UpcomingEventsViewModel {
    
    // MARK: - Properties

    private let networkManager = NetworkManager.shared
    weak var delegate: UpcomingEventsResponseProtocol?

    // MARK: - Fetch Upcoming Events

    func fetchUpcomingEvents() {
        networkManager.request(router: .upcomingEvents) { [weak self] (result: Result<UpcomingEvents, AFError>) in
            switch result {
            case .success(let events):
                self?.delegate?.upcomingEventsSuccess(events: events.results)

            case .failure(let error):
                self?.delegate?.upcomingEventsFail(error: error.localizedDescription)
            }
        }
    }
}
