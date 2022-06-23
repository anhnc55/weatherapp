//
//  VisibilityView.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 23/06/2022.
//

import SwiftUI
import WeatherKit

struct VisibilityView: View {
    var currentWeather: CurrentWeather
    
    var body: some View {
        CustomStackView {
            Label {
                Text("Visibility".uppercased())
            } icon: {
                Image(systemName: "eye")
            }
            
        } contentView: {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(currentWeather.visibility.formatted())
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(currentWeather.visibility.value > 20 ? "It's perfectly clear right now" : "It's not clear right now")
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
