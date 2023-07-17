//
//  PreviousEventsViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 28.06.2023.
//

import UIKit

final class PreviousEventsViewController: UIViewController {

    // MARK: - Properties
    
    var pastEventsViewModel = PastEventsViewModel()
    var pastEventsModel: [Past]?
        
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var pastEventsTableView: UITableView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        registerTableView()
        registerViewModel()
    }

    // MARK: - RegisterTableView

    private func registerTableView() {
        pastEventsTableView.delegate = self
        pastEventsTableView.dataSource = self
        
        pastEventsTableView.register(UINib(nibName: PastTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: PastTableViewCell.nameOfClass)
        pastEventsTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // MARK: - RegisterViewModel

    private func registerViewModel() {
        pastEventsViewModel.delegate = self
        pastEventsViewModel.fetchPastEvents()
    }
}

// MARK: - UITableViewDelegate,DataSource

extension PreviousEventsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pastEventsModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: PastTableViewCell.nameOfClass, for: indexPath) as? PastTableViewCell {
            
            if let pastEvents = pastEventsModel?[indexPath.row] {
                cell.setCell(pastEvents: pastEvents)
              
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

// MARK: - PastEventsResponseProtocol

extension PreviousEventsViewController: PastEventsResponseProtocol {
    func pastEventsSuccess(pastEvents: [Past]) {
        self.pastEventsModel = pastEvents
        pastEventsTableView.reloadData()
    }
    
    func pastEventsFail(error: String) {
        print(error)
    }
}
