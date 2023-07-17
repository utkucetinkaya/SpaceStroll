//
//  ApiRouter.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 19.04.2023.
//

import Foundation

enum Router: String {
    case spaceReports = "https://api.spaceflightnewsapi.net/v4/reports/?format=json&limit=100"
    case spaceBlogs = "https://api.spaceflightnewsapi.net/v4/blogs/?format=json&limit=100"
    case spaceNews = "https://api.spaceflightnewsapi.net/v4/articles/?format=json&limit=100"
    case astronomyPictureOfTheDay = "https://api.nasa.gov/planetary/apod"
    case updates = "https://ll.thespacedevs.com/2.2.0/updates/?format=json&limit=30"
    case upcomingLaunches = "https://ll.thespacedevs.com/2.2.0/launch/upcoming/?limit=30"
    case previousLaunches = "https://ll.thespacedevs.com/2.2.0/launch/previous/?format=json&limit=30&mode=list"
    case upcomingEvents = "https://ll.thespacedevs.com/2.2.0/event/upcoming/?format=json&limit=30"
    case previousEvents = "https://ll.thespacedevs.com/2.2.0/event/previous/?format=json&limit=30"
    case programs = "https://ll.thespacedevs.com/2.2.0/program/?format=json&limit=22"
    case apodElement = "https://api.nasa.gov/planetary/apod?count=100&api_key=DEMO_KEY"
    case marsPhotos = "https://api.nasa.gov/mars-photos/api/v1/rovers/perseverance/latest_photos"
    
    var requiresApiKey: Bool {
           switch self {
           case .astronomyPictureOfTheDay, .marsPhotos:
               return true
           default:
               return false
        }
    }
}

let apiKey = "DEMO_KEY"
