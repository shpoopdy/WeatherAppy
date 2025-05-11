//
//  WeatherModel+Sample.swift
//  WeatherApp
//
//  Created by Michael Crispin on 5/11/25.
//

import Foundation

extension WeatherModel {
  static var sample: [WeatherModel] = [
    WeatherModel(
      name: "New York",
      main: MainWeather(temp: 293.15),
      weather: [
        WeatherDescription(main: "Clear")
      ]
    ),
    WeatherModel(
      name: "San Francisco",
      main: MainWeather(temp: 288.55),
      weather: [
        WeatherDescription(main: "Fog")
      ]
    )
  ]
}
