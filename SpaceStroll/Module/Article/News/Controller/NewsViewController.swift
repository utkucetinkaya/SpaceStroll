//
//  NewsViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.06.2023.
//

import UIKit
import Kingfisher

final class NewsViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var newsTableView: UITableView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var loadingView: UIView! {
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    
    // MARK: - Variables

    var newsViewModel = NewsViewModel()
    var article: [News]?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerViewModel()
        registerTableView()
        showSpinner()
        
    }
    
    // MARK: - ActivityIndicator
    
    private func showSpinner() {
        activityIndicator.startAnimating()
        loadingView.isHidden = false
    }
    
    private func hideSpinner() {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
    }

    // MARK: - RegisterViewModel
   private func registerViewModel() {
        newsViewModel.delegate = self
        newsViewModel.fetchNews()
    }
    
    // MARK: - Register TableView

    private func registerTableView() {
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UINib(nibName: NewsTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: NewsTableViewCell.nameOfClass)
        newsTableView.estimatedRowHeight = UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate,DataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return article?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: NewsTableViewCell.nameOfClass, for: indexPath) as? NewsTableViewCell {
            
            cell.setCell(news: (article?[indexPath.row])!)
            cell.accessoryType = .disclosureIndicator

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = article?[indexPath.row]
        let urlString = selectedData?.url
        
        if let url = URL(string: urlString ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - NewsResponseProtocol

extension NewsViewController: NewsResponseProtocol {
    
    func newsSuccess(article: [News]) {
        self.article = article
        newsTableView.reloadData()
        hideSpinner()
    }
    
    func newsFail(error: String) {
        print(error)
        hideSpinner()
    }
}
