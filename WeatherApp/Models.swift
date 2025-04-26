//
//  Models.swift
//  WeatherApp
//
//  Created by Mikey Crispin on 4/22/25.
//

import Foundation

struct WeatherModel: Codable {
  let name: String
  let main: MainWeather
  let weather: [WeatherDescription]
}

// Actually grabbing from main portion of JSON
struct MainWeather: Codable {
  let temp: Float
}

struct WeatherDescription: Codable {
  let main: String
}
