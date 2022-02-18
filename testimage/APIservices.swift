//
//  APIservices.swift
//  testimage
//
//  Created by Ahmed Saeed on 2/6/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import Foundation
import Alamofire
class NetWorkManager {
  /*  static let instance = NetWorkManager()
    func getdata(url:String,complition:  @escaping (ShowMovies?,Error?)-> Void){
        Alamofire.request(url).responseJSON { (response) in
            guard let data = response.data else {return}
            switch response.result{
                
            case .success(let value):
                do{
                    print(value)
                    let movies = try JSONDecoder().decode(ShowMovies.self, from: data)
                  complition(movies,nil)
                }
                catch let jsonerror{
                print("Failed to create JSON with errorrrrr: ", jsonerror.localizedDescription)
                    complition(nil,jsonerror)
                }
            case .failure(let error):
                print("failor to create JSON with error: ", error.localizedDescription)
                complition(nil,error)
         
            }
            
        }
    }
    */
}
