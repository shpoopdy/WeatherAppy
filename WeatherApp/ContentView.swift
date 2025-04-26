//
//  ContentView.swift
//  WeatherApp
//
//  Created by Mikey Crispin on 4/22/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject var viewModel = WeatherViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        Spacer()
        VStack {
          Text(viewModel.temp)
            .font(.system(size: 42))
          Image(systemName: "cloud.rain")
            .resizable()
            .frame(width: 100, height: 100)
            .padding(.top)
        }
        Spacer()
        Text(viewModel.name)
          .font(.title)
          .bold()
        Text(viewModel.main)
          .font(.system(size: 24))
        Spacer()
      }
      .navigationTitle(Text("Weather"))
      
    }
  }
}

#Preview {
  ContentView()
    .preferredColorScheme(.dark)
}
