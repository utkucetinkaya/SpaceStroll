//
//  BlogsViewModel.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 2.06.2023.
//

import Foundation
import Alamofire

// MARK: - BlogsResponseProtocol

protocol BlogsResponseProtocol: AnyObject {
    func blogsSuccess(blogs: [Blogs])
    func blogsFail(error: String)
}

class BlogsViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: BlogsResponseProtocol?

    // MARK: - Fetch Blogs

    func fetchBlogs() {
        networkManager.request(router: .spaceBlogs) { [weak self] (result: Result<SpaceBlogs, AFError>) in
            switch result {
            case .success(let blogs):
                self?.delegate?.blogsSuccess(blogs: blogs.results)

            case .failure(let error):
                self?.delegate?.blogsFail(error: error.localizedDescription)
            }
        }
    }
}
