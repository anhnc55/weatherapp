//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 22/06/2022.
//

import Foundation
import WeatherKit
import CoreLocation

//@MainActor
//class WeatherData: ObservableObject {
//
//    @Published var currentWeather: CurrentWeather?
//    @Published var dailyForecasts: Forecast<DayWeather>?
//    @Published var hourlyForecasts: Forecast<HourWeather>?
//
//    static let shared = WeatherData()
//
//    private let service = WeatherService.shared
//    
//    func weather(for location: CLLocation) async {
//        let currentWeather = await Task.detached(priority: .userInitiated) {
//            let forcast = try? await self.service.weather(
//                for: location,
//                including: .current)
//            return forcast
//        }.value
//        self.currentWeather = currentWeather
//    }
//    
//    func dailyForecast(for location: CLLocation) async {
//        let dayWeather = await Task.detached(priority: .userInitiated) {
//            let forcast = try? await self.service.weather(
//                for: location,
//                including: .daily)
//            return forcast
//        }.value
//        self.dailyForecasts = dayWeather
//    }
//    
//    func hourlyForecast(for location: CLLocation) async {
//        let hourWeather = await Task.detached(priority: .userInitiated) {
//            let forcast = try? await self.service.weather(
//                for: location,
//                including: .hourly)
//            return forcast
//        }.value
//        self.hourlyForecasts = hourWeather
//    }
//}
