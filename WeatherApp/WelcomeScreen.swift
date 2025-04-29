//
//  WelcomeScreen.swift
//  WeatherApp
//
//  Created by Mikey Crispin on 4/28/25.
//

import SwiftUI

struct WelcomeScreen: View {
  @State var city: String
  @State private var shouldNavigate = false
  @StateObject private var viewModel = WeatherViewModel()
  
  var body: some View {
    NavigationStack {
      Text("Hello! Enter your city below to see the weather.")
        .font(.headline)
      
      TextField("", text: $city)
        .padding()
        .frame(height: 50)
        .overlay(
          RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
            .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
      
      Button("Get Weather") {
        viewModel.fetchWeather(for: city)
        self.shouldNavigate = true
      }
      .navigationDestination(isPresented: $shouldNavigate) {
        ContentView(viewModel: viewModel)
      }
      
//      if shouldNavigate {
//        ContentView(viewModel: viewModel)
//      }
    }
  }
}

#Preview {
  @Previewable var city = "Arcata"
  WelcomeScreen(city: city)
}
