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
    VStack {
      Text(viewModel.temp)
        .font(.system(size: 42))
      Text(viewModel.name)
        .font(.system(size: 24))
      Text(viewModel.main)
        .font(.system(size: 24))
    }
    .padding()
  }
}

#Preview {
  ContentView()
    .preferredColorScheme(.dark)
}
