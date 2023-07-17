//
//  UpcomingEventsModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation

// MARK: - UpcomingEvents
struct UpcomingEvents: Codable {
    let count: Int?
    let next: String?
    let results: [Events]
}

// MARK: - Events

struct Events: Codable {
  
    let name: String?
    let description: String?
    let location: String?
    let featureImage: String?
    let date: String?

    enum CodingKeys: String, CodingKey {
 
        case name
        case description
        case location
        case featureImage = "feature_image"
        case date
    }
}
