//
//  ProgramViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 29.06.2023.
//

import UIKit

final class ProgramViewController: UIViewController {

    // MARK: - Properties
    
    var programViewModel = ProgramViewModel()
    var programModel: [Program]?

    // MARK: - IBOutlets
    
    @IBOutlet fileprivate weak var programTableView: UITableView!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
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
        setNavigationBar()
        showSpinner()
    }
    
    // MARK: - SetNavigationBar

    private func setNavigationBar() {
        navigationItem.title = "Programs"
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.systemBlue]
            }
        navigationItem.backButtonDisplayMode = .minimal
    }
    
    
    // MARK: - RegisterTableView

    private func registerTableView() {
        programTableView.delegate = self
        programTableView.dataSource = self
        
        programTableView.register(UINib(nibName: ProgramTableViewCell.nameOfClass, bundle: nil), forCellReuseIdentifier: ProgramTableViewCell.nameOfClass)
        programTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // MARK: - RegisterViewModel

    private func registerViewModel() {
        programViewModel.delegate = self
        programViewModel.fetchProgram()
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

// MARK: - UITableViewDelegate,DataSource

extension ProgramViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        programModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: ProgramTableViewCell.nameOfClass, for: indexPath) as? ProgramTableViewCell {
            
            if let program = programModel?[indexPath.row] {
                cell.setCell(program: program)
              
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

// MARK: - ProgramResponseProtocol

extension ProgramViewController: ProgramResponseProtocol {
    func programSuccess(program: [Program]) {
        self.programModel = program
        programTableView.reloadData()
        hideSpinner()
    }
    
    func programFail(error: String) {
        print(error)
        hideSpinner()
    }
}
