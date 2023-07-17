//
//  MainViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 1.06.2023.
//

import UIKit
import Parchment

class MainArticleViewController: UIViewController {
    
    // MARK: - Variables
    let titles = [
        "News",
        "Blogs",
        "Reports"
    ]
    
    var pagingViewController: PagingViewController!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Article"
        setupPagingViewController()
        setupMenuInsets()
    }
    
    // MARK: - Function

    func setupPagingViewController() {
        let newsViewController = NewsViewController()
        let blogsViewController = BlogsViewController()
        let reportViewController = ReportViewController()
        
        pagingViewController = PagingViewController(viewControllers: [
            newsViewController,
            blogsViewController,
            reportViewController
        ])
        
        pagingViewController.dataSource = self
        
        addChild(pagingViewController)
        view.addSubview(pagingViewController.view)
        pagingViewController.didMove(toParent: self)
        pagingViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pagingViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pagingViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pagingViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pagingViewController.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    func setupMenuInsets() {
        let statusBarHeight: CGFloat
            if #available(iOS 13.0, *) {
                statusBarHeight = UIApplication.shared.keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            } else {
                statusBarHeight = UIApplication.shared.statusBarFrame.height
            }
            
            let navigationBarHeight = navigationController?.navigationBar.frame.height ?? 0
            let topSpace = statusBarHeight + navigationBarHeight
            
            pagingViewController.menuInsets = UIEdgeInsets(top: topSpace, left: 0, bottom: 0, right: 0)
    }
}

// MARK: - PagingViewControllerDataSource

extension MainArticleViewController: PagingViewControllerDataSource {
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return titles.count
    }

    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        switch index {
        case 0:
            return NewsViewController()
        case 1:
            return BlogsViewController()
        case 2:
            return ReportViewController()

        default:
          return UIViewController()
        }
    }

    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: titles[index])
    }
}
