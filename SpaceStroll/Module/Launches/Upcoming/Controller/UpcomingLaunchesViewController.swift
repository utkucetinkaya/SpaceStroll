//
//  UpcomingLaunchesViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 23.06.2023.
//

import UIKit

final class UpcomingLaunchesViewController: UIViewController {
    
    // MARK: - Variables

    var upcomingViewModel = UpcomingViewModel()
    var upcomingModel: [Upcoming]?
        
    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var upcomingTableView: UITableView!
    @IBOutlet fileprivate weak var loadingView: UIView! {
       
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        registerViewModel()
        showSpinner()
    }
    
    // MARK: - IBAction
    
    @IBAction func infoButtonClicked(_ sender: UIButton) {
        let overLayer = OverLayerPopUpViewController()
        overLayer.appear(sender: self)
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
        upcomingTableView.delegate = self
        upcomingTableView.dataSource = self
        
        upcomingTableView.register(UINib(nibName: UpcomingTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: UpcomingTableViewCell.nameOfClass)
    }
    
    // MARK: - RegisterViewModel

   private func registerViewModel() {
        upcomingViewModel.delegate = self
        upcomingViewModel.fetchUpcoming()
    }
}

//MARK: - UITableViewProtocol

extension UpcomingLaunchesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        upcomingModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: UpcomingTableViewCell.nameOfClass, for: indexPath) as? UpcomingTableViewCell {
            
            if let upcoming = upcomingModel?[indexPath.row] {
                cell.setCell(upcoming: upcoming)
              
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

//MARK: - UpcomingResponseProtocol

extension UpcomingLaunchesViewController: UpcomingResponseProtocol {
    func upcomingSuccess(upcoming: [Upcoming]) {
        upcomingModel = upcoming
        upcomingTableView.reloadData()
        self.hideSpinner()
    }
    
    func upcomingFail(error: String) {
        print(error)
        self.hideSpinner()
    }
}
