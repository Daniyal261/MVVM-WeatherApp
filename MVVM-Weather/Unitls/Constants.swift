//
//  Constants.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

struct Constants {
    
    struct Urls {
        static func urlForWeatherByCity(city: String) -> URL {
            let userDefaults = UserDefaults.standard
            let unit = userDefaults.value(forKey: "unit") as? String ?? "imperial"
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\( city.escaped())&appid=ef0fd9866ca027e0dca474cee84c53be&units=\(unit)")!
        }
    }
}
