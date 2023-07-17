//
//  ReportsViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 2.06.2023.
//

import Foundation
import Alamofire

// MARK: - ReportsResponseProtocol

protocol ReportsResponseProtocol: AnyObject {
    func reportsSuccess(reports: [Report])
    func reportsFail(error: String)
}

class ReportsViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: ReportsResponseProtocol?

    // MARK: - Fetch Reports

    func fetchReports() {
        networkManager.request(router: .spaceReports) { [weak self] (result: Result<SpaceReports, AFError>) in
            switch result {
            case .success(let reports):
                self?.delegate?.reportsSuccess(reports: reports.results)

            case .failure(let error):
                self?.delegate?.reportsFail(error: error.localizedDescription)
            }
        }
    }
}
