//
//  UpcomingModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 23.06.2023.
//

import Foundation

// MARK: - UpcomingLaunches
struct UpcomingLaunches: Codable {
    let count: Int?
    let next: String?
    let results: [Upcoming]
}

// MARK: - Upcoming
struct Upcoming: Codable {
    let id: String?
    let name: String?
    let status: NetPrecision?
    let net: String?
    let launchServiceProvider: LaunchServiceProvider?
    let pad: Pad?
    let webcastLive: Bool?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id, name, status
        case net
        case launchServiceProvider = "launch_service_provider"
        case pad
        case webcastLive = "webcast_live"
        case image
    }
}

// MARK: - LaunchServiceProvider
struct LaunchServiceProvider: Codable {
    let name: String?
}

// MARK: - NetPrecision
struct NetPrecision: Codable {
    let id: Int?
    let name, abbrev, description: String?
}

// MARK: - Pad
struct Pad: Codable {
    let location: Location?
}

// MARK: - Location
struct Location: Codable {
    let name: String?
}
