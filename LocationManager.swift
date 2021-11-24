//
//  LocationManager.swift
//  Project 3
//
//  Created by Tia Petts on 4/7/21.
//

import Foundation

class LocationManager {
    static func getLocationDetails(zip: String) -> [String: [Location]] {
        
        var returnVal: [String: [Location]] = [:]
        // Do any additional setup after loading the view.
        
        //let verona = Location(lat: 42.99, lng: -89.55, placeName: "Verona")
        //print(verona)
        
        let url = URL(string: "http://api.geonames.org/postalCodeSearchJSON?formatted=true&postalcode=53593&countryCode=US&username=tpetts&style=full")!
        
        let locationRequest = URLSession.shared.dataTask(with:url) {
            (data, response, error) in
            if let data = data {
                //print(String(data: data, encoding: .utf8))
                
                let decoder = JSONDecoder()
                //decode data into an object into an instance of the Location class
                do {
                    let locations = try decoder.decode([String: [Location]].self, from: data)
                    returnVal = locations
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        locationRequest.resume()
        return returnVal
    }

    
}
