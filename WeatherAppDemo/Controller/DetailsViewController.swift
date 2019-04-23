//
//  DetailsViewController.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    var selectedCity = String()
    let wetherViewModel = WeatherViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        getWetherData()
    }
    //MARK: setupui
    func setupUI() {
      
        for data in wetherViewModel.WetherData{
            if selectedCity == data.name{
                humidity.text = String(data.main.humidity)
                maxTemp.text = "\(data.main.temp_max)°"
                minTemp.text = "\(data.main.temp_min)°"
                
            }
        }
    }
    

    //MARK: get weather data
    func getWetherData() {
        wetherViewModel.fetchWeatherData { (completed, error) in
            if completed {
                self.setupUI()
            }
        }
    }
    
    
    @IBAction func backClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
