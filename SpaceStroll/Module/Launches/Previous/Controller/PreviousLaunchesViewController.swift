//
//  PreviousLaunchesViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 23.06.2023.
//

import UIKit

final class PreviousLaunchesViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var pastTableView: UITableView!
    // MARK: - Properties
    
    var previousModel: [Previous]?
    var previousViewModel = PreviousViewModel()

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableView()
        registerViewModel()
    }
    
    // MARK: - Register TableView&ViewModel

    private func registerTableView() {
       pastTableView.delegate = self
       pastTableView.dataSource = self
       pastTableView.register(UINib(nibName: PreviousTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: PreviousTableViewCell.nameOfClass)
    }
    
    private func registerViewModel() {
        previousViewModel.delegate = self
        previousViewModel.fetchPrevious()
    }
}

// MARK: - UITableViewDelegate, DataSource

extension PreviousLaunchesViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        previousModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PreviousTableViewCell.nameOfClass, for: indexPath) as? PreviousTableViewCell {
            
            if let previous = previousModel?[indexPath.row] {
                cell.setCell(previous: previous)
              
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

// MARK: - PreviousResponseProtocol

extension PreviousLaunchesViewController: PreviousResponseProtocol {
    func previousSuccess(previous: [Previous]) {
        self.previousModel = previous
        pastTableView.reloadData()
    }
    
    func previousFail(error: String) {
        print(error)
    }
}
