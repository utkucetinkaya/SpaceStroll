//
//  ProgramViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 29.06.2023.
//

import Foundation
import Alamofire

// MARK: - ProgramResponseProtocol

protocol ProgramResponseProtocol: AnyObject {
    func programSuccess(program: [Program])
    func programFail(error: String)
}

class ProgramViewModel {
    
    // MARK: - Properties

    private let networkManager = NetworkManager.shared
    weak var delegate: ProgramResponseProtocol?

    // MARK: - FetchProgram

    func fetchProgram() {
        networkManager.request(router: .programs) { [weak self] (result: Result<ProgramModel, AFError>) in
            switch result {
            case .success(let program):
                self?.delegate?.programSuccess(program: program.results)

            case .failure(let error):
                self?.delegate?.programFail(error: error.localizedDescription)
            }
        }
    }
}
