//
//  ViewController.swift
//  testimage
//
//  Created by Ahmed Saeed on 2/6/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    @IBOutlet weak var moviescollectionview: UICollectionView!
    var Movies : ShowMovies?
    var results = [Result]()
    var mainaddress = "https://image.tmdb.org/t/p/w500"
    override func viewDidLoad() {
        super.viewDidLoad()
        
      moviescollectionview.delegate = self
        moviescollectionview.dataSource = self
        getmovies()
       
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return results.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mycell", for: indexPath) as! CollectionViewCell
        cell.title.text = results[indexPath.row].title
       // cell.image.loadImage(URL(string: (mainaddress + results[indexPath.row].posterPath)))
        cell.image.loadImage(urlstring: mainaddress+results[indexPath.row].posterPath)
        //cell.configurationImages(image: mainaddress + results[indexPath.row].posterPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:"show", sender: results[indexPath.row])
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailsViewController{
            if let selectedmovie = sender as? Result{
               destination.selectedMovie = selectedmovie
               
                
            }
    }
  


  }
    func getmovies(){
        APIServices.instance.API(method:.get, url: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&fbclid=IwAR1UYrCwv0watsy3GXWfSVtM75DGQbMVS2xDV52dgs1IYBGvX2hvlYIPWqI") { (err, response:ShowMovies?) in
            if let errorresponse = err{
                print("Failed to create JSON with error: ", errorresponse.localizedDescription)
            }
            else{
                guard let movie = response else {return}
                self.results = movie.results
                self.Movies = movie
                self.moviescollectionview.reloadData()
                
            }
        }
    }
}
