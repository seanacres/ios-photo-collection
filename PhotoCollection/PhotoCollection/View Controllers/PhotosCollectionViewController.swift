//
//  PhotosCollectionViewController.swift
//  PhotoCollection
//
//  Created by Sean Acres on 6/13/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotosCollectionViewController: UICollectionViewController {

	let photoController = PhotoController()
	let themeHelper = ThemeHelper()
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
        collectionView.reloadData()
		setTheme()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
	
    // MARK: - Navigation

	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		switch segue.identifier {
		case "updatePhotoSegue":
			guard let photoDetailVC = segue.destination as? PhotoDetailViewController,
			let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
			photoDetailVC.photo = photoController.photos[indexPath.item]
			photoDetailVC.photoController = photoController
			photoDetailVC.themeHelper = themeHelper
		case "createPhotoSegue":
			guard let photoDetailVC = segue.destination as? PhotoDetailViewController else { return }
			photoDetailVC.photoController = photoController
			photoDetailVC.themeHelper = themeHelper
		case "selectThemeSegue":
			guard let themeSelectionVC = segue.destination as? ThemeSelectionViewController else { return }
			themeSelectionVC.themeHelper = themeHelper
		default:
			return
		}
    }


    // MARK: UICollectionViewDataSource
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photoController.photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
    	cell.photo = photoController.photos[indexPath.item]
		
		return cell
    }
	
	func setTheme() {
		guard let theme = themeHelper.themePreference else { return }
		switch theme {
		case "Dark":
			collectionView.backgroundColor = #colorLiteral(red: 0.03480474278, green: 0.03486460075, blue: 0.03481400758, alpha: 1)
		case "Blue":
			collectionView.backgroundColor = #colorLiteral(red: 0.1203275058, green: 0.5686235742, blue: 0.9068016188, alpha: 1)
		default:
			collectionView.backgroundColor = .gray
		}
	}

}
