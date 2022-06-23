//
//  WeartherDataView.swift
//  Weather
//
//  Created by Anh Nguyen on 22/06/2022.
//

import SwiftUI
import WeatherKit

struct WeatherDataView: View {
    var currentWeather: CurrentWeather
    
    var body: some View {
        
        VStack(spacing: 8) {
//            airQualityView()
            
            HStack {
                UVIndexView(uvIndex: currentWeather.uvIndex)
                WindView(wind: currentWeather.wind)
            }.frame(maxHeight: .infinity)
            
            HStack {
                FeelslikeView(currentWeather: currentWeather)
                HumidityView(currentWeather: currentWeather)
            }.frame(maxHeight: .infinity)

            HStack {
                VisibilityView(currentWeather: currentWeather)
                PressureView(currentWeather: currentWeather)
            }.frame(maxHeight: .infinity)

        }
    }
}
