//
//  WeatherViewModel.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class WeatherViewModel : NSObject {
    
    
    var WetherData = [WeatherModel]()
    
    //fetch wether data
    func fetchWeatherData(completionHandler: @escaping(Bool, String?) -> Void){
        
        NetWorkCallClass.shared.fetchWether() { (response, error) in
            
            if response != nil
            {
                self.WetherData = Mapper<WeatherModel>().mapArray(JSONArray: response!)
                
                completionHandler(true,error)
                
            }else{
                completionHandler(false, error)
            }
        }
    }
}
