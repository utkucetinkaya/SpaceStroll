//
//  ApodModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 19.04.2023.
//

import Foundation

// MARK: - Apod
struct Apod: Codable {
    let copyright, date, explanation: String?
    let hdurl: String?
    let mediaType, serviceVersion, title: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}
