//
//  NewsModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.06.2023.
//

import Foundation

// MARK: - SpaceNews

struct SpaceNews: Codable {
    let count: Int?
    let next: String?
    let results: [News]
}

// MARK: - News
struct News: Codable {
    let id: Int?
    let title: String?
    let url: String?
    let imageURL: String?
    let newsSite, summary: String?
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
