//
//  PreviousEventsModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation

// MARK: - PreviousEvents
struct PreviousEvents: Codable {
    let count: Int?
    let next: String?
    let results: [Past]
}

// MARK: - Result
struct Past: Codable {
   
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
