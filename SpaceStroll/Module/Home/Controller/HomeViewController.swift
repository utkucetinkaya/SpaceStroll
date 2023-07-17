//
//  HomeViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.05.2023.
//

import UIKit
import Kingfisher

final class HomeViewController: UIViewController {

    // MARK: - IBOutlets
   
    @IBOutlet fileprivate weak var updatesTableView: UITableView!
    @IBOutlet fileprivate weak var apodDateLabel: UILabel!
    @IBOutlet fileprivate weak var apodImageView: UIImageView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var loadingView: UIView! {
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    // MARK: - Variables
    
    var apodViewModel = ApodViewModel()
    var apod: Apod?
    var updatesViewModel = UpdatesViewModel()
    var updates: [Updates]?
        
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        registerViewModel()
        showSpinner()
       
    }
    
    @objc func showMiracle() {
        let slideVC = OverlayView()
        slideVC.modalPresentationStyle = .custom
        slideVC.transitioningDelegate = self
        self.present(slideVC, animated: true)
    }
    
    @IBAction func moreButtonClicked(_ sender: UIButton) {
        showMiracle()
    }
    
    // MARK: - Register ViewModel

    func registerViewModel() {
        // Register Apod
        apodViewModel.delegate = self
        apodViewModel.fetchApod()
        
        // Register Updates
        updatesViewModel.delegate = self
        updatesViewModel.fetchUpdates()
    }
    
    // MARK: - RegisterTableView

    private func registerTableView() {
        
        updatesTableView.delegate = self
        updatesTableView.dataSource = self
        updatesTableView.register(UINib(nibName: UpdatesTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: UpdatesTableViewCell.nameOfClass)
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
    
    private func setUI(apod: Apod) {
        // set date label
        apodDateLabel.text = apod.date
        
        // set apod image view
        apodImageView.kf.setImage(with: apod.url?.asURL)
   
    }
}

// MARK: - UITableViewDelegate,DataSource

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updates?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: UpdatesTableViewCell.nameOfClass, for: indexPath) as? UpdatesTableViewCell {
            
            cell.setCell(updates: (updates?[indexPath.row])!)

            cell.accessoryType = .disclosureIndicator

            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = updates?[indexPath.row]
        let urlString = selectedData?.infoURL
        
        if let url = URL(string: urlString ?? "") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - Apod ViewModel Protocol

extension HomeViewController: ApodResponseProtocol {
    
    func apodSuccess(apod: Apod) {
        setUI(apod: apod)
        hideSpinner()
    }
    
    func apodFail(error: String) {
        print(error)
        hideSpinner()
    }
}

// MARK: - Updates ViewModel Protocol

extension HomeViewController: UpdatesResponseProtocol {
    func updatesSuccess(updates: [Updates]) {
        self.updates = updates
        updatesTableView.reloadData()
        hideSpinner()
    }
    
    func updatesFail(error: String) {
        print(error)
        hideSpinner()
    }
}

    // MARK: - TransitioningDelegate

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}
