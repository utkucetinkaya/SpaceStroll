//
//  ApodElementViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 4.07.2023.
//

import UIKit

final class ApodElementViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var apodElementTableView: UITableView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet fileprivate weak var loadingView: UIView! {
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    // MARK: - Properties

    var apodElementViewModel = ApodElementViewModel()
    var apodElement : [ApodElement]?
      
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Astronomy Pictures Of Days"

        tableViewRegister()
        viewModelRegister()
        showSpinner()
        configureNavBar()
    }
    
    // MARK: - ConfigureNavBar

    private func configureNavBar() {
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    // MARK: - RegisterTableView

    private func tableViewRegister() {
        apodElementTableView.delegate = self
        apodElementTableView.dataSource = self
        
        apodElementTableView.register(UINib(nibName: ApodElementTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: ApodElementTableViewCell.nameOfClass)
        apodElementTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // MARK: - RegisterViewModel

    private func viewModelRegister() {
        apodElementViewModel.delegate = self
        apodElementViewModel.FetchApodElement()
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
}

    // MARK: - UITableViewDelegate, DataSource

extension ApodElementViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        apodElement?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if let cell = tableView.dequeueReusableCell(withIdentifier: ApodElementTableViewCell.nameOfClass, for: indexPath) as? ApodElementTableViewCell {
            
            if let apod = apodElement?[indexPath.row] {
                cell.setCell(apodElement: apod)
              
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

    // MARK: - ApodElementResponseProtocol

extension ApodElementViewController: ApodElementResponseProtocol {
    func apodElementSuccess(apodElement: [ApodElement]) {
        self.apodElement = apodElement
        apodElementTableView.reloadData()
        hideSpinner()
    }
    
    func apodElementFail(error: String) {
        print(error)
        hideSpinner()
    }
}
