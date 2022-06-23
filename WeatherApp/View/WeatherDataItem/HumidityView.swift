//
//  HumidityView.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 23/06/2022.
//

import SwiftUI
import WeatherKit

struct HumidityView: View {
    var currentWeather: CurrentWeather
    
    var body: some View {
        CustomStackView {
            Label {
                Text("Humidity".uppercased())
            } icon: {
                Image(systemName: "humidity")
            }
            
        } contentView: {
            
            VStack(alignment: .leading, spacing: 10) {
                Text("\((currentWeather.humidity * 100).formatted())%")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("The dew point is \(currentWeather.dewPoint.formatted()) right now")
                    .font(.callout)
                    .fontWeight(.regular)

            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
        }
    }
}
