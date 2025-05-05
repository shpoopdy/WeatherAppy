//
//  SearchView.swift
//  WeatherApp
//
//  Created by Mikey Crispin on 5/5/25.
//

import SwiftUI

struct SearchView: View {
  @State var searchText: String = ""
    var body: some View {
      TextField("Search",text: $searchText)
        .padding()
        .frame(height: 50)
        .overlay(
          RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
            .stroke(Color.gray, lineWidth: 1)
        )
        .padding()
    }
}

#Preview {
    SearchView()
}
