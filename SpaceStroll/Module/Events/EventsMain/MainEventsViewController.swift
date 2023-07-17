//
//  MainEventsViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import Foundation
import Parchment

class MainEventsViewController: UIViewController {

    // MARK: - Variables
    let titles = [
        "Upcoming",
        "Previous"
    ]
    
    var pagingViewController: PagingViewController!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPagingViewController()
        setupMenuInsets()
        title = "Events"
    }
    
    // MARK: - Function

    func setupPagingViewController() {
        let upcomingEventsViewController = UpcomingEventsViewController()
        let previousEventsViewController = PreviousEventsViewController()
        
        pagingViewController = PagingViewController(viewControllers: [
            upcomingEventsViewController,
            previousEventsViewController
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

extension MainEventsViewController: PagingViewControllerDataSource {
    func numberOfViewControllers(in pagingViewController: PagingViewController) -> Int {
        return titles.count
    }

    func pagingViewController(_: PagingViewController, viewControllerAt index: Int) -> UIViewController {
        switch index {
        case 0:
            return UpcomingEventsViewController()
        case 1:
            return PreviousEventsViewController()

        default:
          return UIViewController()
        }
    }

    func pagingViewController(_: PagingViewController, pagingItemAt index: Int) -> PagingItem {
        return PagingIndexItem(index: index, title: titles[index])
    }
}
