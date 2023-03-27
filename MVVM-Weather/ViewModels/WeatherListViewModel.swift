//
//  WeatherListViewModel.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

struct WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel( vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }
    
    func numberOfRows(section:Int) -> Int {
        return weatherViewModels.count
    }
    
    func modelAt(index:Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
    
    mutating func updateUnit(to unit : Unit) {
        switch unit {
        case .celsius:
            toCelcisu()
        case .fahrenheit:
            toFahrenheit()
        }
    }
    
    mutating func toCelcisu() {
        weatherViewModels =  weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    mutating func toFahrenheit() {
        weatherViewModels =  weatherViewModels.map { vm in
            let weatherModel = vm
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        }
    }
}


class WeatherViewModel {
    let weather : WeatherResponse
    var temperature: Double
    
    init(weather: WeatherResponse) {
        self.weather = weather
        temperature = weather.main.temp
    }
    
    var city: String {
        weather.name
    }

}
