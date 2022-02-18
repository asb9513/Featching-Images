//
//  CollectionViewCell.swift
//  testimage
//
//  Created by Ahmed Saeed on 2/6/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit

class CollectionViewCell:UICollectionViewCell{
    var mainaddress = "https://image.tmdb.org/t/p/w500"
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    func configurationImages(model: Result) {
       // guard let imagurl = mainaddress+model.backdropPath else {return}
        image.loadImage(urlstring: mainaddress+model.backdropPath)
    }
    
    
    
    
}
