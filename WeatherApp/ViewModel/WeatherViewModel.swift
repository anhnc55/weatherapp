//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 22/06/2022.
//

import Foundation
import CoreLocation
import SwiftUI
import WeatherKit
import Combine

class WeatherViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentWeather: CurrentWeather?
    @Published var dailyForecasts: Forecast<DayWeather>?
    @Published var hourlyForecasts: Forecast<HourWeather>?
    @Published var location: CLLocation!
    @Published var cityName: String = "----"
    
    @Published var todayWeather: DayWeather?
    
    private let service = WeatherService.shared

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.first else { return }
        self.location = location
        Task.detached {
            await self.weather(for: location)
            await self.hourlyForecast(for: location)
            await self.dailyForecast(for: location)
            
            await self.getTodayWeather()
        }
        getCityName(location)
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    func getCityName(_ location: CLLocation) {
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, _) -> Void in
            placemarks?.forEach { (placemark) in
                if let city = placemark.locality {
                    self.cityName = city
                }
            }
        })
    }
}

@MainActor
extension WeatherViewModel {
    func getTodayWeather() {
        self.dailyForecasts?.forEach({ weather in
            let diff = Calendar.current.dateComponents([.day], from: Date(), to: weather.date)
            if diff.day == 0 {
                self.todayWeather = weather
            }
        })
    }

    func weather(for location: CLLocation) async {
        let currentWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(
                for: location,
                including: .current)
            return forcast
        }.value
        self.currentWeather = currentWeather
        print(currentWeather?.dewPoint)
    }
    
    func dailyForecast(for location: CLLocation) async {
        let dayWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(
                for: location,
                including: .daily)
            return forcast
        }.value
        self.dailyForecasts = dayWeather
    }
    
    func hourlyForecast(for location: CLLocation) async {
        let hourWeather = await Task.detached(priority: .userInitiated) {
            let forcast = try? await self.service.weather(
                for: location,
                including: .hourly)
            return forcast
        }.value
        self.hourlyForecasts = hourWeather
    }
}
