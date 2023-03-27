//
//  AddWeatherViewModel.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(for city:String, completionHandler: @escaping (WeatherViewModel) -> Void ) {
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        let weatherResource = Resource(url: weatherURL) { data in
            print(data)
            var messages:WeatherResponse?
            do {
                messages = try JSONDecoder().decode(WeatherResponse.self, from: data)
                print(messages as Any)
                return messages

            } catch DecodingError.dataCorrupted(let context) {
                print(context)
            } catch DecodingError.keyNotFound(let key, let context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.valueNotFound(let value, let context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch DecodingError.typeMismatch(let type, let context) {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("error: ", error)
            }
            return messages

            //return data
        }
        
        WebService().load(resource: weatherResource) { (result) in
            if let weatherResource = result {
                let vm = WeatherViewModel(weather:weatherResource)
                completionHandler(vm)
            }
        }
    }
}
