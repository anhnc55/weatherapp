//
//  FeelslikeView.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 23/06/2022.
//

import SwiftUI
import WeatherKit

struct FeelslikeView: View {
    var currentWeather: CurrentWeather
    
    var body: some View {
        CustomStackView {
            Label {
                Text("FEELS LIKE".uppercased())
            } icon: {
                Image(systemName: "thermometer.medium")
            }
            
        } contentView: {
            
            VStack(alignment: .leading) {
                Text(currentWeather.apparentTemperature.formatted())
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(currentWeather.temperature.value > currentWeather.apparentTemperature.value
                     ? "Humidity is making it feel hotter"
                     : "Humidity is making it feel cooler")
                    .font(.callout)
                    .fontWeight(.regular)
                Spacer()

            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
        }
    }
}
