//
//  WeatherModel.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import ObjectMapper

class WeatherModel : NSObject , Mappable {
    
    var name  = ""
    var main = Main()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        main <- map["main"]
        
    }
    
}

class Main : NSObject , Mappable {
    
    var temp = Double()
    var humidity = Int()
    var temp_min = Int()
    var temp_max = Int()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        temp <- map["temp"]
        humidity <- map["humidity"]
        temp_min <- map["temp_min"]
        temp_max <- map["temp_max"]
        
        
    }
    
}
