//
//  Uitilities.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation


class Utilities : NSObject {
    
   
    let appID =  "2c8700db6c9fde5963c04504c25247b2"
    
    func getWeatherURL(appid: String) -> String {
        return "http://api.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=metric&APPID=\(appid)"
        
        //https://samples.openweathermap.org/data/2.5/group?id=524901,703448,2643743&units=metric&appid=b6907d289e10d714a6e88b30761fae22
    }
}
