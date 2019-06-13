//
//  PhotoController.swift
//  PhotoCollection
//
//  Created by Sean Acres on 6/13/19.
//  Copyright © 2019 Sean Acres. All rights reserved.
//

import Foundation

class PhotoController {
    var photos: [Photo] = []
    
    func createPhoto(imageData: Data, title: String) {
        let photo = Photo(imageData: imageData, title: title)
        photos.append(photo)
    }
    
    func updatePhoto(photo: Photo, imageData: Data, title: String) {
        guard let index = photos.firstIndex(of: photo) else { return }
        photos[index].imageData = photo.imageData
        photos[index].title = title
    }
}
