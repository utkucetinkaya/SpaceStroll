//
//  ExploreViewController.swift
//  SpaceStroll
//
//  Created by Utku Çetinkaya on 21.06.2023.
//

import UIKit

final class ExploreViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet fileprivate weak var exploreCollectionView: UICollectionView!
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
    }
    
    // MARK: - RegisterCollectionView

    private func registerCollectionView() {
        
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
        exploreCollectionView.register(UINib(nibName: ExploreCollectionViewCell.nameOfClass, bundle: nil), forCellWithReuseIdentifier: ExploreCollectionViewCell.nameOfClass)
    }
}

// MARK: - CollectionViewDelegate, DataSource

extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exploreModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        let cell = exploreCollectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.nameOfClass, for: indexPath) as! ExploreCollectionViewCell
        cell.setCell(explore: exploreModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
          case 0:
            // Launches
            let mainLaunchesViewController = MainLaunchesViewController()
            self.navigationController?.pushViewController(mainLaunchesViewController, animated: true)
          case 1:
            // Events
              let mainEventsViewController = MainEventsViewController()
              self.navigationController?.pushViewController(mainEventsViewController, animated: true)
        case 2:
            // MarsPhotos
            let marsPhotosViewController = MarsPhotosViewController()
            self.navigationController?.pushViewController(marsPhotosViewController, animated: true)
        case 3:
            // Article
            let mainArticleViewController = MainArticleViewController()
            self.navigationController?.pushViewController(mainArticleViewController, animated: true)
        case 4:
            // ApodElement
            let apodElementViewController = ApodElementViewController()
            self.navigationController?.pushViewController(apodElementViewController, animated: true)
        case 5:
            // Programs
            let programViewController = ProgramViewController()
            self.navigationController?.pushViewController(programViewController, animated: true)
            
          default:
              break
        }
    }
}
