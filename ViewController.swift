//
//  ViewController.swift
//  Project 3
//
//  Created by Tia Petts on 4/7/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var zipCode: UITextField!
    
    @IBAction func searchTouched(_ sender: Any) {
        //getTasks()
        
        //make a request to api, if getting http error, you need the api key
        if let locationURL = URL(string: "http://api.geonames.org/postalCodeSearchJSON?username=tpetts&postalcode=53960&country=US") {
            
            let locationTask = URLSession.shared.dataTask(with: locationURL) {
                (data, response, error) in
            
                if let data = data {
                    let jsonDecoder = JSONDecoder()
                    do {
                        print(data)
                        let locationInfo = try jsonDecoder.decode([String: [Location]].self, from: data)
                        print(locationInfo)
                        print(locationInfo["postalCodes"]?[0].latitude)
                        print(locationInfo["postalCodes"]?[0].longitude)
                        
                        
                        
                        let weatherURL = URL(string: "http://api.geonames.org/findNearByWeatherJSON?formatted=true&username=tpetts&lat=43.423053&lng=-89.235362")
                        
                        let weatherTask
                        weatherTask = URLSession.shared.dataTask(with: weatherURL!) {
                        (data, response, error) in
                            print("Task Completed")
                          if let weatherData = data {
                                let jsonDecoder = JSONDecoder()
                            
                            // what stack overflow suggested
                            guard let weatherData = data, error == nil else {
                                print(error?.localizedDescription)
                                return
                            }
                                do {
                                    let weatherInfo = try jsonDecoder.decode([String: [Weather]], from: weatherData)
                                    // temp
                                    print(weatherInfo["temperature"]?[0].temp)
                                    // wind speed
                                    print(weatherInfo["windspeed"]?[0].speed)
                                    // wind direction
                                    print(weatherInfo["wind direction"]?[0].direction)
                                }
                            }
                        }

                        }
                        catch {
                            print(error)
                        }
                    //print(String(data: data, encoding: .utf8))
                }
            }
            // next line always goes outside of the let statement block above
            locationTask.resume();
            weatherTask.resume();
        }
    }
    

        override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //LocationManager.getLocationDetails(zip: "53593")
        //print(Location(lat: <#T##Double#>, lng: <#T##Double#>, placeName: <#T##String#>, state: <#T##String#>))
    }
    


}

}
