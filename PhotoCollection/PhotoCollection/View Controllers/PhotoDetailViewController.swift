//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Sean Acres on 6/13/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
	
	var themeHelper: ThemeHelper?
	var photo: Photo?
	var photoController: PhotoController?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
		
    }
	
	@IBAction func savePhotoButtonTapped(_ sender: UIBarButtonItem) {
        guard let imageData = photoImageView.image?.pngData(), let title = titleTextField.text else { return }
        
        if photo == nil {
            photoController?.createPhoto(imageData: imageData, title: title)
        } else {
            guard let photo = photo else { return }
            photoController?.updatePhoto(photo: photo, imageData: imageData, title: title)
        }
	}
    
    func setTheme() {
        guard let themeHelper = themeHelper,
            let themePreference = themeHelper.themePreference else { return }
        switch themePreference {
        case "Dark":
            view.backgroundColor = #colorLiteral(red: 0.03480474278, green: 0.03486460075, blue: 0.03481400758, alpha: 1)
        case "Blue":
            view.backgroundColor = #colorLiteral(red: 0.1203275058, green: 0.5686235742, blue: 0.9068016188, alpha: 1)
        default:
            view.backgroundColor = .gray
        }
    }
        
    func updateViews() {
        setTheme()
        guard let photo = photo else { return }
        photoImageView.image = UIImage(data: photo.imageData)
        titleTextField.text = photo.title
    }
}
