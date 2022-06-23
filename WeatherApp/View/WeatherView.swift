//
//  Weather.swift
//  Weather
//
//  Created by Anh Nguyen on 22/06/2022.
//

import SwiftUI
import CoreLocation
import WeatherKit

struct WeatherView: View {
    
//    @StateObject var weatherData = WeatherData.shared
    @StateObject var viewModel = WeatherViewModel()

    @State var locationManager = CLLocationManager()
    @State var offset: CGFloat = 0

    var topEdge: CGFloat
    
    var body: some View {
        ZStack {
            GeometryReader{ proxy in
                Image("sky")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width,
                           height: proxy.size.height)
            }
            .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .center, spacing: 5) {
                        Text(viewModel.cityName)
                            .font(.system(size: 35))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                        
                        Text(viewModel.currentWeather?.temperature.formatted(.measurement(width: .abbreviated, usage: .weather)) ?? "---")
                            .font(.system(size: 45))
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text(viewModel.currentWeather?.wind.speed.formatted(.measurement(width: .abbreviated, usage: .general)) ?? "---")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                        
                        Text(viewModel.currentWeather?.condition.description ?? "---")
                            .foregroundStyle(.secondary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())

                        
                        Text("H: \(viewModel.todayWeather?.highTemperature.formatted(.measurement(width: .abbreviated, usage: .weather)) ?? "-")  L: \(viewModel.todayWeather?.lowTemperature.formatted(.measurement(width: .abbreviated, usage: .weather)) ?? "-")")
                            .foregroundStyle(.primary)
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                            .opacity(getTitleOpactiy())
                    }
                    .offset(y: -offset)
                    .offset(y: offset > 0 ? (offset / UIScreen.main.bounds.width) * 100 : 0)
                    .offset(y: getTitleOffset())
                    .environmentObject(viewModel)
                    
                    VStack(spacing: 8) {
                        if let forecasts = viewModel.hourlyForecasts {
                            CustomStackView {
                                Label {
                                    Text("Hourly Forecast")
                                } icon: {
                                    Image(systemName: "clock")
                                }
                            } contentView: {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 8) {
                                        ForEach(forecasts, id: \.date) { weather in
                                            HourForecastItemView(hourWeather: weather)
                                        }
                                        
                                    }
                                }
                            }
                        }
                        if let forecasts = viewModel.dailyForecasts {
                            DailyForecastView(dailyForecast: forecasts)
                        }
                        
                        if let currentWeather = viewModel.currentWeather {
                            WeatherDataView(currentWeather: currentWeather)
                        }
                    }
                    .padding(.top, 20)
                }
                .padding(.top, 25)
                .padding(.top, topEdge)
                .padding([.horizontal, .bottom])
                .overlay(
                    GeometryReader{ proxy -> Color in
                        let minY = proxy.frame(in: .global).minY
                        DispatchQueue.main.async {
                            self.offset = minY
                        }
                        return Color.clear
                        
                    }
                )
            }
        }
        .onAppear(perform: {
            locationManager.delegate = viewModel
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestLocation()
        })
    }
    
    private func getTitleOpactiy()->CGFloat{
        
        let titleOffset = -getTitleOffset()
        
        let progress = titleOffset / 20
        
        let opacity = 1 - progress
        
        return opacity
    }
    
    private func getTitleOffset() -> CGFloat {
        if offset < 0 {
            let progress = -offset / 120
            let newOffset = (progress <= 1.0 ? progress : 1) * 20
            return -newOffset
        }
        return 0
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(topEdge: 8)
    }
}

