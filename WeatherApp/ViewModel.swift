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
      fetchWeather(for: "Seattle")
    }
  
  func fetchWeather(for city: String) {
    let cityQuery = city.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? city
    let apiKey = ""
    guard let url = URL(string:
      "https://api.openweathermap.org/data/2.5/weather?q=\(cityQuery),us&appid=\(apiKey)"
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
          self.temp = "\(((model.main.temp - 273.15) * 9/5 + 32).rounded())°"
          self.main = model.weather.first?.main ?? "-"
        }
      } catch {
        print("No Data Available")
      }
    }
    task.resume()
  }
}
