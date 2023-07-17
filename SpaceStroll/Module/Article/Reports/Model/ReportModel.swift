//
//  ReportModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 2.06.2023.
//

import Foundation
// MARK: - SpaceReports
struct SpaceReports: Codable {
    let count: Int?
    let next: String?
    let results: [Report]
}

// MARK: - Report
struct Report: Codable {
    let id: Int?
    let title: String?
    let url: String?
    let imageURL: String?
    let newsSite: ReportsNewsSite?
    let summary: String?
    let publishedAt: String?
    let updatedAt: String?
}

enum ReportsNewsSite: String, Codable {
    case nasa = "NASA"
}
