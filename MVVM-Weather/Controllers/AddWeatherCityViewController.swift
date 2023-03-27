//
//  AddWeatherCityViewController.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation
import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddWeatherCityViewController : UIViewController{
    @IBOutlet weak var txtCityName: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    let vm = AddWeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnSavePressed(_ sender: Any) {
        if let city = txtCityName.text {
            vm.addWeather(for: city) { (vm) in
                self.delegate?.addWeatherDidSave(vm: vm)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func btnClosePressed(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
}
