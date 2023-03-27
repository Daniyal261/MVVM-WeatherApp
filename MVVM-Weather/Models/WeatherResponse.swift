//
//  WeatherResponse.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

struct WeatherResponse:Decodable {
    let main:Weather
    let name: String
}

struct Weather: Decodable {
    let temp: Double
    let humidity: Double
}


