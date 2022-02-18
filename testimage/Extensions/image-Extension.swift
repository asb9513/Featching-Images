//
//  image-Extension.swift
//  testimage
//
//  Created by Ahmed Saeed on 2/10/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import Foundation
import  UIKit


extension UIImageView{
    /// this function loads the image from url using kingfiher pod
    /// - Parameter url: the image url to convret to image
    func loadImage(urlstring : String?) {
        guard let url = URL(string: urlstring!) else {return}
        DispatchQueue.global().async { [weak self] in
            if let dataa = try? Data(contentsOf: url){
                if let image = UIImage(data: dataa){
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
                
            }
       
        }
    }
}
