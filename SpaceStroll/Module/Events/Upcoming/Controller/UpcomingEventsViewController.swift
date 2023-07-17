//
//  UpcomingEventsViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import UIKit

final class UpcomingEventsViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var upcomingEventsTableView: UITableView!
    
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet fileprivate weak var loadingView: UIView! {
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    
    //MARK: - Properties

    var eventsModel: [Events]?
    var eventsViewModel = UpcomingEventsViewModel()
        
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        registerViewModel()
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

    // MARK: - RegisterTableView

    private func registerTableView() {
        upcomingEventsTableView.delegate = self
        upcomingEventsTableView.dataSource = self
        
        upcomingEventsTableView.register(UINib(nibName: UpcomingEventsTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: UpcomingEventsTableViewCell.nameOfClass)
    }
    
    // MARK: - RegisterViewModel

    private func registerViewModel() {
        eventsViewModel.delegate = self
        eventsViewModel.fetchUpcomingEvents()
    }
}

    // MARK: - TableViewDelegate, DataSource

extension UpcomingEventsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        eventsModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingEventsTableViewCell.nameOfClass, for: indexPath) as? UpcomingEventsTableViewCell {
            
            if let events = eventsModel?[indexPath.row] {
                cell.setCell(events: events)
              
            } else {
                let alert = UIAlertController(title: "Hata", message: "Değer nil.", preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Tamam", style: .default, handler: nil)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
            }
            
            return cell
           
        }
        return UITableViewCell()
    }
}

    // MARK: - UpcomingEventsResponseProtocol

extension UpcomingEventsViewController: UpcomingEventsResponseProtocol {
    func upcomingEventsSuccess(events: [Events]) {
        self.eventsModel = events
        upcomingEventsTableView.reloadData()
        hideSpinner()
    }
    
    func upcomingEventsFail(error: String) {
        print(error)
        hideSpinner()
    }
}
