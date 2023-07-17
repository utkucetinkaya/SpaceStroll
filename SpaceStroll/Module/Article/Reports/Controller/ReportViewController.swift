//
//  ReportViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.06.2023.
//

import UIKit

final class ReportViewController: UIViewController {
        
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var reportTableView: UITableView!
    
    // MARK: - Variables
    
    var reportsViewModel = ReportsViewModel()
    var reportsModel: [Report]?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerReportsViewModel()
        registerReportsTableView()
    }
    
    // MARK: - RegisterViewModel

    func registerReportsViewModel() {
        reportsViewModel.delegate = self
        reportsViewModel.fetchReports()
    }
    
    // MARK: - Register TableView

    private func registerReportsTableView() {
        reportTableView.delegate = self
        reportTableView.dataSource = self
        reportTableView.register(UINib(nibName: ReportTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: ReportTableViewCell.nameOfClass)
    }
}

// MARK: - UITableViewDelegate,DataSource

extension ReportViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        reportsModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ReportTableViewCell.nameOfClass, for: indexPath) as? ReportTableViewCell {
            
            cell.setCell(report: (reportsModel?[indexPath.row])!)
            cell.accessoryType = .disclosureIndicator

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = reportsModel?[indexPath.row]
        let urlString = selectedData?.url
        
        if let url = URL(string: urlString ?? "") {
            // Varsayilan tarayicida ac
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - ReportsResponseProtocol

extension ReportViewController: ReportsResponseProtocol {
    func reportsSuccess(reports: [Report]) {
        self.reportsModel = reports
        reportTableView.reloadData()
    }
    
    func reportsFail(error: String) {
        print(error)
    }
}
