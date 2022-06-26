//
//  DailyForecastView.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 23/06/2022.
//

import SwiftUI
import WeatherKit

struct DailyForecastView: View {
    var dailyForecast: Forecast<DayWeather>
    
    var timeFormat: Date.FormatStyle {
        Date.FormatStyle().day(.defaultDigits)
    }

    var body: some View {
        CustomStackView {
            Label {
                Text("\(String(dailyForecast.count)) Forecast")
                
            } icon: {
                Image(systemName: "calendar")
            }
        } contentView: {
            
            VStack(alignment: .leading, spacing: 10) {
                
                ForEach(dailyForecast, id: \.date) { cast in
                    
                    VStack(alignment: .leading, spacing: 0) {
                        HStack(spacing: 15) {
                            Text(cast.date, format: timeFormat)
                                .font(.title3.bold())
                                .foregroundStyle(.white)
                                .frame(width: 60, alignment: .leading)
                            
                            Image(systemName: cast.symbolName)
                                .font(.title3)
                                .symbolVariant(.fill)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle((cast.condition == .mostlyClear || cast.condition == .clear) ? .yellow : .white)
                                .frame(width: 30)
                            
                            Text("\(cast.lowTemperature.formatted(.measurement(width: .abbreviated, usage: .weather)))")
                                .font(.title3.bold())
                                .foregroundStyle(.secondary)
                                .foregroundStyle(.white)
                            
                            ZStack(alignment: .leading) {
                                
                                Capsule()
                                    .fill(.tertiary)
                                    .foregroundStyle(.white)
                                
                                GeometryReader { proxy in
                                    Capsule()
                                        .fill(temperatureGradient(low: cast.lowTemperature, high: cast.highTemperature))
                                        .frame(width: (cast.highTemperature.value / 40) * proxy.size.width)
                                }
                            }
                            .frame(height: 4)
                            
                            Text("\(cast.highTemperature.formatted(.measurement(width: .abbreviated, usage: .weather)))")
                                .font(.title3.bold())
                                .foregroundStyle(.white)
                        }
                        
                        Divider()
                    }
                    .padding(.vertical, 8)
                }
            }
        }
    }
}

extension DailyForecastView {
    func temperatureGradient(low: Measurement<UnitTemperature>, high: Measurement<UnitTemperature>) -> LinearGradient {
        var lowTemperature = low.value
        var highTemperature = high.value
        
        switch low.unit {
        case .kelvin:
            lowTemperature = convertKelvinToCelsius(value: low.value)
            highTemperature = convertKelvinToCelsius(value: high.value)
        case .fahrenheit:
            lowTemperature = convertFahrenheittoCelsius(value: low.value)
            highTemperature = convertFahrenheittoCelsius(value: high.value)
        default: break
        }
        var colors = [Color]()
        
        if lowTemperature < 5 {
            colors.append(.green)
        } else if lowTemperature < 15 && lowTemperature >= 5 {
            colors.append(contentsOf: [.green, .mint])
        } else if lowTemperature < 20 && lowTemperature >= 15 {
            colors.append(contentsOf: [.mint, .yellow])
        } else {
            colors.append(contentsOf: [.yellow])
        }
        
        if highTemperature > 30 {
            colors.append(contentsOf: [.orange, .red])
        }
        
        if highTemperature > 35 {
            colors.append(contentsOf: [.purple])
        }
        
        return .linearGradient(.init(colors: colors),
                               startPoint: .leading, endPoint: .trailing)
    }
    
    func convertFahrenheittoCelsius(value: Double) -> Double {
        return (value - 32)/1.8
    }
    
    
    func convertKelvinToCelsius(value: Double) -> Double {
        return (value - 273.15)
    }
}
