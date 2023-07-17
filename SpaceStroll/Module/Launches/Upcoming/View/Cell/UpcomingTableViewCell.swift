//
//  UpcomingTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 23.06.2023.
//

import UIKit
import Kingfisher

class UpcomingTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var locationNameLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var launchNameLabel: UILabel!
    @IBOutlet fileprivate weak var abbrevLabel: UILabel!
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var countdownLabel: UILabel!
    @IBOutlet fileprivate weak var abbrevView: UIView!
    @IBOutlet fileprivate weak var upcomingImageView: UIImageView!
    
    // MARK: - Properties
    
    weak var timer: Timer?
    var countdownDate: Date?

//     MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        stopTimer()
    }
    
    // MARK: - SetCell
    
    func setCell(upcoming: Upcoming) {
        nameLabel.text = upcoming.name
        upcomingImageView.kf.setImage(with: upcoming.image?.asURL)
        launchNameLabel.text = upcoming.launchServiceProvider?.name
        locationNameLabel.text = upcoming.pad?.location?.name
        dateLabel.text = Date.formattedDateFromString(dateString: upcoming.net ?? "")
        startCountdown(upcoming: upcoming)
        abbrevLabel.text = upcoming.status?.abbrev
        
        //abbrev view
       
        if let statusAbbreviation = upcoming.status?.abbrev {
            switch statusAbbreviation {
            case "Go":
                abbrevView.backgroundColor = UIColor.green
            case "Success":
                abbrevView.backgroundColor = UIColor.green
            case "TBD":
                abbrevView.backgroundColor = UIColor.orange
            case "TBC":
                abbrevView.backgroundColor = UIColor.yellow
            default:
                abbrevView.backgroundColor = UIColor.cyan
            }
        }
    }
    
    // MARK: - Countdown
       
       func startCountdown(upcoming: Upcoming) {
           guard let dateString = upcoming.net else {
               countdownLabel.text = "Could not get date information"
               return
           }
           
           guard let countdownDate = Date.formattedDate(from: dateString) else {
               countdownLabel.text = "Could not get date information"
               return
           }
           
           let timeInterval = countdownDate.timeIntervalSinceNow
           if timeInterval > 0 {
               countdownLabel.text = countdownDate.countdownString()
               self.countdownDate = countdownDate
               startTimer()
           } else {
               countdownLabel.text = "Countdown ended"
           }
       }
       
       private func startTimer() {
           stopTimer()
           timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
           RunLoop.current.add(timer!, forMode: .common)
       }
       
       private func stopTimer() {
           timer?.invalidate()
           timer = nil
       }
       
       private func stopCountdown() {
           stopTimer()
           countdownDate = nil
       }
       
       @objc private func updateCountdown() {
           guard let countdownDate = countdownDate else {
               return
           }
           
           let timeInterval = countdownDate.timeIntervalSinceNow
           if timeInterval > 0 {
               countdownLabel.text = countdownDate.countdownString()
           } else {
               countdownLabel.text = "Countdown ended"
               stopCountdown()
           }
       }
}
