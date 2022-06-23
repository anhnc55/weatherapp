//
//  ContentView.swift
//  Weather
//
//  Created by Anh Nguyen on 22/06/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WeatherView(topEdge: 28)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
