//
//  PhotosCollectionViewCell.swift
//  PhotoCollection
//
//  Created by Sean Acres on 6/13/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
	
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoLabel: UILabel!
	
	var photo: Photo? {
		didSet {
			updateViews()
		}
	}
	
	func updateViews() {
		guard let photo = photo else { return }
		imageView.image = UIImage(data: photo.imageData)
		photoLabel.text = photo.title
	}
}
