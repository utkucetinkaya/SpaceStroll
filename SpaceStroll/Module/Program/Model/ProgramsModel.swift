//
//  ProgramsModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 29.06.2023.
//

import Foundation

// MARK: - Programs
struct ProgramModel: Codable {
    let count: Int?
    let results: [Program]
}

// MARK: - Result
struct Program: Codable {
    let id: Int?
    let name, description: String?
    let imageURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case imageURL = "image_url"
        
    }
}
