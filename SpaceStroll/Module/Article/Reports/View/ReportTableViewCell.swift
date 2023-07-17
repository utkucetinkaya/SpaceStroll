//
//  ReportTableViewCell.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 15.06.2023.
//

import UIKit

class ReportTableViewCell: UITableViewCell {

    //MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var summaryLabel: UILabel!
  
    // MARK: - SetCell
    
    func setCell(report:Report) {
        titleLabel.text = report.title
        summaryLabel.text = report.summary
        dateLabel.text = report.publishedAt
        dateLabel.text = Date.formattedDateFromString(dateString: report.publishedAt ?? "")
    }
}

