//
//  NetworkManager.swift
//  IOSNetworkingI
//
//  Created by MahmoudRamadan on 4/18/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {

    static  func getClasses(completion : @escaping([Course]) ->  Void){
        let endpoint = "https://mindylou.github.io/classes.json"
        
        AF.request(endpoint,method: .get).validate().responseData { (response) in
            
            switch response.result{
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let courseResp = try? jsonDecoder.decode(CourseResponse.self, from: data){
                    let classes = courseResp.data.classes
                    completion(classes)
                }
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
    }
}
