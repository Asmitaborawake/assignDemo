//
//  ViewController.swift
//  WeatherAppDemo
//
//  Created by Mac on 23/04/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController  {

    @IBOutlet weak var weatherTableView: UITableView!
    
    let wetherViewModel = WeatherViewModel()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        getWetherData()
        storeDataInCD()
    }
    //MARK: get weather data
    func getWetherData() {
        wetherViewModel.fetchWeatherData { (completed, error) in
            if completed {
                self.weatherTableView.reloadData()
            }
        }
    }
    //MARK: save data in coredata method
    func storeDataInCD() {
        if let index = weatherTableView.indexPathForSelectedRow {
        let data = wetherViewModel.WetherData[index.row]
        let newwetherDataStoreInCD = Weather(context: self.context)
        newwetherDataStoreInCD.name = data.name
        newwetherDataStoreInCD.temp = data.main.temp
        self.saveitems()
        }
    }
    
    //MARK: data manupulation method
    //save data to context
    func saveitems(){
        do{
            try context.save()
        }catch{
            print("error saving context \(error)")
        }
        self.weatherTableView.reloadData()
    }
    


}

extension ViewController : UITableViewDataSource , UITableViewDelegate {
    
    //MARK: datasource Method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wetherViewModel.WetherData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weatherTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! WeatherTableViewCell
        
        let data = wetherViewModel.WetherData[indexPath.row]
        cell.cityName.text = data.name
        cell.temp.text = "\(data.main.temp)°"
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //MARK: delegate method
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! DetailsViewController
        
        if let index =  weatherTableView.indexPathForSelectedRow {
            destinationVC.selectedCity = wetherViewModel.WetherData[index.row].name
        }
    }
}

