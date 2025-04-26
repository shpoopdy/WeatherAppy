//
//  ViewModels.swift
//  WeatherApp
//
//  Created by Mikey Crispin on 4/22/25.
//

import Foundation

class WeatherViewModel: ObservableObject {
  @Published var main = "-"
  @Published var temp = "-"
  @Published var name = "-"
  
    init() {
      fetchWeather()
    }
  
  func fetchWeather() {
    guard let url = URL(string:
      "https://api.openweathermap.org/data/2.5/weather?q=arcata,us&appid=b311a0205534b3f90603fce1502a47be"
    ) else {
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, _, error in
      guard let data = data, error == nil else {
        return
      }
      
      do {
        let model = try JSONDecoder().decode(WeatherModel.self, from: data)
        DispatchQueue.main.async {
          self.name = model.name
          self.temp = "\(((model.main.temp - 273.15) * 9/5 + 32).rounded())"
          self.main = model.weather.first?.main ?? "-"
        }
      } catch {
        print("Ooops")
      }
    }
    task.resume()
  }
}
