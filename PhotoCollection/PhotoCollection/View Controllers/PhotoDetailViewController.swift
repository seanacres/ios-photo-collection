//
//  PhotoDetailViewController.swift
//  PhotoCollection
//
//  Created by Sean Acres on 6/13/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    @IBOutlet weak var createPhotoImageView: UIImageView!
    @IBOutlet weak var titleTextField: UITextField!
	
	var themeHelper: ThemeHelper?
	var photo: Photo?
	var photoController: PhotoController?
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPhoto(_ sender: UIButton) {
		
    }
	
	@IBAction func savePhotoButtonTapped(_ sender: UIBarButtonItem) {
		
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
