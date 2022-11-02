//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by Rohit Sharma on 03/10/22.
//

import Foundation

struct WeatherResponse : Codable {
    let name : String
    let weather : [WeatherAPI]
    let main : MainAPI
}

struct WeatherAPI : Codable {
    let description : String
    let main : String
}

struct MainAPI : Codable {
    let temp : Double
    let pressure : Double
    let humidity : Double
    let temp_min : Double
    let temp_max : Double
    let feels_like : Double
}
