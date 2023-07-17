//
//  File.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.06.2023.
//

import Foundation
import Alamofire

// MARK: - NewsResponseProtocol

protocol NewsResponseProtocol: AnyObject {
    func newsSuccess(article: [News])
    func newsFail(error: String)
}

class NewsViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    
    weak var delegate: NewsResponseProtocol?

    // MARK: - Fetch News

    func fetchNews() {
        networkManager.request(router: .spaceNews) { [weak self] (result: Result<SpaceNews, AFError>) in
            switch result {
            case .success(let article):
                self?.delegate?.newsSuccess(article: article.results)
            case .failure(let error):
                self?.delegate?.newsFail(error: error.localizedDescription)
            }
        }
    }
}
