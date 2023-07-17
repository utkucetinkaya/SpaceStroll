//
//  PreviousModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation

// MARK: - PreviousLaunches
struct PreviousLaunches: Codable {
    let count: Int?
    let next: String?
    let results: [Previous]
}

// MARK: - Previous
struct Previous: Codable {
  
    let name: String?
    let status: PreviousNetPrecision?
    let net: String?
    let netPrecision: PreviousNetPrecision?
    let lspName, mission, missionType, pad: String?
    let location: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case name, status
        case net
        case netPrecision = "net_precision"
        case lspName = "lsp_name"
        case mission
        case missionType = "mission_type"
        case pad, location
        case image
    }
}

// MARK: - NetPrecision
struct PreviousNetPrecision: Codable {
    let id: Int?
    let name: String?
    let abbrev: String?
    let description: String?
}
