//
//  SettingsViewModel.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName:String {
        get {
            switch(self) {
            case .celsius:
                return "Celcius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases
    
    var selectedUnit:Unit {
        get {
            let userDef = UserDefaults.standard
            var unitValue = ""
            if let value = userDef.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        
        set {
            let userDef = UserDefaults.standard
            userDef.set(newValue.rawValue, forKey: "unit")
        }
    }
}
