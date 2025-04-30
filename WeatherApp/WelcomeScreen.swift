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
      Text("Hello!")
        .font(.largeTitle)
        .fontWeight(.black)
        .padding(.bottom, 42)
      
      TextField("", text: $city)
        .padding()
        .frame(height: 50)
        .overlay(
          RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
            .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
      
      Button(action: {
        viewModel.fetchWeather(for: city)
        self.shouldNavigate = true
      }, label: {
        Text("Get Weather")
          .fontWeight(.heavy)
          .font(.title3)
          .frame(maxWidth: .infinity)
          .padding()
          .foregroundStyle(.black)
          .background(Color.gray)
          .cornerRadius(40)
      })
      .navigationDestination(isPresented: $shouldNavigate) {
        ContentView(viewModel: viewModel)
      }
    }
    .padding()
  }
}

#Preview {
  @Previewable var city = "Arcata"
  WelcomeScreen(city: city)
}
