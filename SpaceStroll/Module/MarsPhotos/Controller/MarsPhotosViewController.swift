//
//  MarsPhotosViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 6.07.2023.
//

import UIKit

final class MarsPhotosViewController: UIViewController {
  
    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var solLabel: UILabel!
    @IBOutlet fileprivate weak var marsPhotoCollectionView: UICollectionView!
    @IBOutlet fileprivate weak var roverNameLabel: UILabel!
    @IBOutlet fileprivate weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet fileprivate weak var loadingView: UIView! {
        didSet {
            loadingView.layer.cornerRadius = 6
        }
    }
    
    // MARK: - Properties
    
    var marsPhotosViewModel = MarsPhotosViewModel()
    var marsPhotoModel: [LatestPhoto]?
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mars Photos"
        registerViewModel()
        registerCollectionView()
        showSpinner()
    }
    
    // MARK: - RegisterCollectionView

    private func registerCollectionView() {
        marsPhotoCollectionView.delegate = self
        marsPhotoCollectionView.dataSource = self
        marsPhotoCollectionView.register(UINib(nibName: MarsPhotoCollectionViewCell.nameOfClass, bundle: nil), forCellWithReuseIdentifier: MarsPhotoCollectionViewCell.nameOfClass)
    }
    
    // MARK: - RegisterViewModel

    private func registerViewModel() {
        marsPhotosViewModel.delegate = self
        activityIndicator.startAnimating()
        marsPhotosViewModel.FetchLatestPhoto()
    }
    private func setUI(marsPhoto: [LatestPhoto]) {
        dateLabel.text = ("Latest Photo Date: \(marsPhoto[0].earthDate ?? "")")
        solLabel.text = String("Sol: \(marsPhoto[0].sol ?? 0)")
        roverNameLabel.text = "Rover: Perseverance"
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

    // MARK: - UICollectionViewDelegate, DataSource

extension MarsPhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        marsPhotoModel?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = marsPhotoCollectionView.dequeueReusableCell(withReuseIdentifier: MarsPhotoCollectionViewCell.nameOfClass, for: indexPath) as! MarsPhotoCollectionViewCell
        cell.setCell(photoModel: (marsPhotoModel?[indexPath.row])!)
        return cell
    }
}

    // MARK: - LatestPhotoResponseProtocol

extension MarsPhotosViewController: LatestPhotoResponseProtocol {
    func latestPhotoSuccess(latestPhoto: [LatestPhoto]) {
        self.marsPhotoModel = latestPhoto
        marsPhotoCollectionView.reloadData()
        setUI(marsPhoto: marsPhotoModel ?? [])
        hideSpinner()
    }
    
    func latestPhotoFail(error: String) {
        print(error)
        hideSpinner()
    }
}
