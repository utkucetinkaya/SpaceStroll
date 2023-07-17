//
//  BlogsViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.06.2023.
//

import UIKit

final class BlogsViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var blogsTableView: UITableView!
    
    // MARK: - Variables
    
    var blogsViewModel = BlogsViewModel()
    var blogsModel: [Blogs]?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blogsViewModelRegister()
        blogsTableViewRegister()
    }
    
    // MARK: - BlogsViewModelRegister

    private func blogsViewModelRegister() {
        blogsViewModel.delegate = self
        blogsViewModel.fetchBlogs()

    }
    
    // MARK: - BlogsTableViewRegister

    private func blogsTableViewRegister() {
        blogsTableView.delegate = self
        blogsTableView.dataSource = self
        blogsTableView.register(UINib(nibName: NewsTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.nameOfClass)
    }
}
// MARK: - UITableViewDelegate,DataSource

extension BlogsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        blogsModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.nameOfClass, for: indexPath) as? NewsTableViewCell {
            
            cell.setBlogsCell(blogs: (blogsModel?[indexPath.row])!)
            cell.accessoryType = .disclosureIndicator

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = blogsModel?[indexPath.row]
        let urlString = selectedData?.url
        
        if let url = URL(string: urlString ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - BlogsResponseProtocol

extension BlogsViewController: BlogsResponseProtocol {
    func blogsSuccess(blogs: [Blogs]) {
        self.blogsModel = blogs
        blogsTableView.reloadData()
    }
    
    func blogsFail(error: String) {
        print(error)
    }
}
