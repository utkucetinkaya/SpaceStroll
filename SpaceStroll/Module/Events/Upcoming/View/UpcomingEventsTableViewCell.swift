//
//  UpcomingEventsTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import UIKit
import Kingfisher

class UpcomingEventsTableViewCell: UITableViewCell {
 
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var eventImageView: UIImageView!
    @IBOutlet fileprivate weak var timerLabel: UILabel!
    @IBOutlet fileprivate weak var descLabel: UILabel!
    @IBOutlet fileprivate weak var locationLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    
    // MARK: - Properties
    
    weak var timer: Timer?
    var countdownDate: Date?

    
//     MARK: - Lifecycle

    override func prepareForReuse() {
        super.prepareForReuse()
        stopTimer()
    }
    
    // MARK: - SetCell

    func setCell(events: Events) {
        // SetNameLabel
        nameLabel.text = events.name
        
        // SetEventImageView
        eventImageView.kf.indicatorType = .activity
        eventImageView.kf.indicator?.view.backgroundColor = .systemBackground
        eventImageView.kf.indicator?.view.layer.cornerRadius = 6
        eventImageView.kf.setImage(
            with: events.featureImage?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
        
        // SetDescLabel
        descLabel.text = events.description
        
        // SetDateLabel
        dateLabel.text = Date.formattedDateFromString(dateString: events.date ?? "")
        
        // SetLocationLabel
        locationLabel.text = events.location
        
        // SetTimer
        startCountdown(events: events)
    }
    
    // MARK: - Countdown
       
       func startCountdown(events: Events) {
           guard let dateString = events.date else {
               timerLabel.text = "Could not get date information"
               return
           }
           
           guard let countdownDate = Date.formattedDate(from: dateString) else {
               timerLabel.text = "Could not get date information"
               return
           }
           
           let timeInterval = countdownDate.timeIntervalSinceNow
           if timeInterval > 0 {
               timerLabel.text = countdownDate.countdownString()
               self.countdownDate = countdownDate
               startTimer()
           } else {
               timerLabel.text = "Countdown ended"
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
               timerLabel.text = countdownDate.countdownString()
           } else {
               timerLabel.text = "Countdown ended"
               stopCountdown()
           }
       }
}
