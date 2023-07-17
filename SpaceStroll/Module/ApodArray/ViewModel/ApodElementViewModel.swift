//
//  ApodElementViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 4.07.2023.
//

import Foundation
import Alamofire

// MARK: - ApodElementResponseProtocol

protocol ApodElementResponseProtocol: AnyObject {
    func apodElementSuccess(apodElement: [ApodElement])
    func apodElementFail(error: String)
}

class ApodElementViewModel {
    
    // MARK: - Properties
    
    private let networkManager = NetworkManager.shared
    weak var delegate: ApodElementResponseProtocol?
    var apodElement: [ApodElement] = []
    
    // MARK: - FetchApodElement
    
    func FetchApodElement() {
        networkManager.request(router: .apodElement) { [weak self] (result: Result<[ApodElement], AFError>) in
            switch result {
            case .success(let apodElements):
                self?.delegate?.apodElementSuccess(apodElement: apodElements)
            case .failure(let error):
                self?.delegate?.apodElementFail(error: error.localizedDescription)
            }
        }
    }
}
