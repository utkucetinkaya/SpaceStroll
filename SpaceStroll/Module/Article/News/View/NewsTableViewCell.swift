//
//  NewsTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 2.06.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var descLabel: UILabel!
    @IBOutlet fileprivate weak var newsImageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var newsSiteLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var backView: UIView!
    
    // MARK: - SetCell
    
    func setCell(news: News) {
        
        descLabel.text = news.summary
        titleLabel.text = news.title
        newsSiteLabel.text = news.newsSite
        if let publishedDate = Date.formattedDate(from: news.publishedAt ?? "") {
            let pastTime = publishedDate.getPastTime()
            dateLabel.text = pastTime
        }
        
        newsImageView.kf.indicatorType = .activity
        newsImageView.kf.indicator?.view.backgroundColor = .systemBackground
        newsImageView.kf.indicator?.view.layer.cornerRadius = 6
        newsImageView.kf.setImage(
            with: news.imageURL?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
    }
    
    func setBlogsCell(blogs: Blogs) {
        
        descLabel.text = blogs.summary
        titleLabel.text = blogs.title
        newsSiteLabel.text = blogs.newsSite
        if let publishedDate = Date.formattedDate(from: blogs.publishedAt ?? "") {
            let pastTime = publishedDate.getPastTime()
            dateLabel.text = pastTime
        }
        
        newsImageView.kf.indicatorType = .activity
        newsImageView.kf.indicator?.view.backgroundColor = .systemBackground
        newsImageView.kf.indicator?.view.layer.cornerRadius = 6
        newsImageView.kf.setImage(
            with: blogs.imageURL?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
    }
}
