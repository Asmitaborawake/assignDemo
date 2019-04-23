//
//  NetWorkCallClass.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire
class NetWorkCallClass : NSObject {
    
    let utility = Utilities()
    
    
    static let shared = NetWorkCallClass()
    
    
    func fetchWether(completionHandler: @escaping (([[String:Any]]?,String?) -> Swift.Void)) -> Void {
        
        // let parameters:Parameters = nil
        //get app url
        let url = self.utility.getWeatherURL(appid: utility.appID)
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
            .validate()
            .responseJSON(completionHandler: { response in
                switch response.result {
                    
                case .success:
                    
                    if let responseObject = response.result.value as? [String:Any] {
                        let JSON = responseObject["list"] as! [[String:Any]]
                        //sending response in completionhandler
                        completionHandler(JSON,nil)
                        
                    }
                    
                case .failure(let error):
                    print(error)
                    
                    
                    
                }
            })
        
    }
    
}
