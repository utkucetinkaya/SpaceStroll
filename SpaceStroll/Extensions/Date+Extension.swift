//
//  DateFormatter.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 6.06.2023.
//

import Foundation

// MARK: - FormattedDate

extension Date {

    static func formattedDateFromString(dateString: String) -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        if let date = inputFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }

    static func formattedDate(from dateStr: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: dateStr)
        return date
    }
                                  
    
    // MARK: - GetPastTime

     func getPastTime() -> String {
        var secondsAgo = Int(Date().timeIntervalSince(self))
        if secondsAgo < 0 {
            secondsAgo = secondsAgo * (-1)
        }

        let minute = 60
        let hour = 60 * minute
        let day = 24 * hour
        let week = 7 * day

        if secondsAgo < minute {
            if secondsAgo < 2 {
                return "just now"
            } else {
                return "\(secondsAgo) secs ago"
            }
        } else if secondsAgo < hour {
            let min = secondsAgo/minute
            if min == 1 {
                return "\(min) min ago"
            } else {
                return "\(min) mins ago"
            }
        } else if secondsAgo < day {
            let hr = secondsAgo/hour
            if hr == 1 {
                return "\(hr) hr ago"
            } else {
                return "\(hr) hrs ago"
            }
        } else if secondsAgo < week {
            let day = secondsAgo/day
            if day == 1 {
                return "\(day) day ago"
            } else {
                return "\(day) days ago"
            }
        } else {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd, hh:mm a"
            let strDate: String = formatter.string(from: self)
            return strDate
        }
    }
}

// MARK: - CountdownString

extension Date {
    
     func countdownString() -> String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute, .second], from: Date(), to: self)
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        return String(format: "%02dd %02dh %02dm %02ds", days, hours, minutes, seconds)
    }
}
