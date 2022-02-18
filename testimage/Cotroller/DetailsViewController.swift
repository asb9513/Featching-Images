//
//  DetailsViewController.swift
//  testimage
//
//  Created by Ahmed Saeed on 2/10/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var vote: UILabel!
    @IBOutlet weak var overview: UITextView!
    var mainaddress = "https://image.tmdb.org/t/p/w500"
    var lbl:String?
    var selectedMovie : Result?
    var votingCount : Double?
    override func viewDidLoad() {
        super.viewDidLoad()
       
     print(selectedMovie)
       overview.text = selectedMovie?.overview
     //   poster.loadImage(URL(string: (mainaddress + selectedMovie!.posterPath)))
        poster.loadImage(urlstring:mainaddress+selectedMovie!.posterPath )
        vote.text = String(Double((selectedMovie?.voteAverage)!))
        // Do any additional setup after loading the view.
    }
    

 

}
