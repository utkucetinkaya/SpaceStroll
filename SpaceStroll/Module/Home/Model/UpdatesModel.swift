//
//  UpdatesModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 22.06.2023.
//

import Foundation

// MARK: - SpaceUpdates

struct SpaceUpdates: Codable {
    let count: Int?
    let next: String?
    let results: [Updates]
}

// MARK: - Updates
struct Updates: Codable {
    let id: Int?
    let profileImage: String?
    let comment: String?
    let infoURL: String?
    let createdBy: String?
    let createdOn: String?

    enum CodingKeys: String, CodingKey {
        case id
        case profileImage = "profile_image"
        case comment
        case infoURL = "info_url"
        case createdBy = "created_by"
        case createdOn = "created_on"
    }
}
