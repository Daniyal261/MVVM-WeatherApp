//
//  WeatherCellView.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation
import UIKit

class WeatherCellView: UITableViewCell {
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblTemperature:UILabel!
    
    func configure(vm:WeatherViewModel) {
        self.lblTitle.text = vm.weather.name
        self.lblTemperature?.text = "\(vm.temperature.formateAsDegree())"
    }
}
