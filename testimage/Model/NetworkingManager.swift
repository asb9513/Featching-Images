//
//  NetworkingManager.swift
//  testimage
//
//  Created by Ahmed Saeed on 2/9/22.
//  Copyright © 2022 Ahmed Saeed. All rights reserved.
//

import Foundation
import Alamofire
class APIServices {
    static let instance = APIServices()
    func API<T: Codable>( userImage: Data? = nil, method: HTTPMethod, url: String, parameters:[String:Any]? = nil, header: [String:String]?  = nil, completion: @escaping (_ error: Error?, _ response: T?)->Void) {
        Alamofire.request(url, method: method, parameters: parameters, encoding: URLEncoding.methodDependent, headers: header)
            .responseJSON { res -> Void in
                switch res.result
                {
                case .failure(let error):
                    completion(error,nil)
                case .success(_):
                        do{
                            guard let data = res.data else { return }
                            let response = try JSONDecoder().decode(T.self, from: data)
                            //print(response)
                            completion(nil,response)
                        }catch let err{
                            print("Error In Decode Data \(err.localizedDescription)")
                            completion(err,nil)
                        }
                    }
                
                }
        }
        
    }
    

