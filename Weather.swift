//
//  WeatherManager.swift
//  Project 3
//
//  Created by Tia Petts on 11/11/21.
//

import Foundation

class Weather : CustomStringConvertible, Codable {
    
    var windspeed: Int
    var temperature: Int
    var windDirection: Int
    
    var description: String {
        return "Wind Speed: \(self.windspeed)\nTemperature: \(self.temperature)\nWind Direction: \(self.windDirection)"
    }
    
    init(windspeed: Int, temp: Int, windDirection: Int) {
        self.windspeed = windspeed
        self.temperature = temp
        self.windDirection = windDirection
    }
    
    required init(from decoder: Decoder) throws {
        // step 2 of re-mapping the data of the key value pairs
        let valueContainer = try decoder.container(keyedBy: WeatherKeys.self)
        self.windspeed = try valueContainer.decode(Int.self, forKey: .windspeed)
        self.temperature = try valueContainer.decode(Int.self, forKey: .temperature)
        self.windDirection = try valueContainer.decode(Int.self, forKey: .windDirection)
    }
    
    enum WeatherKeys: String, CodingKey {
        // step 1 of re-mapping data of the key value pairs
        case windspeed = "windspeed"
        case temperature = "temperature"
        case windDirection = "windDirection"
    }
    
    
    
}
