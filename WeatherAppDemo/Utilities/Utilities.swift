//
//  Uitilities.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation


class Utilities : NSObject {
    
   // let base_URL = "http://api.openweathermap.org/data/2.5/weather?id=707860&units=metric&APPID=2c8700db6c9fde5963c04504c25247b2"
    let appID =  "2c8700db6c9fde5963c04504c25247b2"
    
    func getWeatherURL(appid: String) -> String {
        return "http://api.openweathermap.org/data/2.5/weather?id=707860&units=metric&\(appid)"
    }
}
