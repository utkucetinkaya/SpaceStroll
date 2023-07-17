//
//  BlogsModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 2.06.2023.
//

import Foundation

// MARK: - SpaceBlogs

struct SpaceBlogs: Codable {
    let count: Int?
    let next: String?
    let results: [Blogs]
}

// MARK: - Blogs
struct Blogs: Codable {
    let id: Int?
    let title: String?
    let url: String?
    let imageURL: String?
    let newsSite: String?
    let summary: String?
    let publishedAt: String?
    let updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, url, summary
        case imageURL = "image_url"
        case newsSite = "news_site"
        case publishedAt = "published_at"
        case updatedAt = "updated_at"
    }
}


//enum BlogsNewsSite: String, Codable {
//    case europeanSpaceflight = "European Spaceflight"
//    case planetarySociety = "Planetary Society"
//    case unitedLaunchAlliance = "United Launch Alliance"
//}
