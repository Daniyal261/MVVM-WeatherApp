//
//  WeatheListTableViewController.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

import UIKit

class WeatherListTableViewController: UITableViewController {
    var weatherListViewModel = WeatherListViewModel()
    var lastSelectedUnit: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        setup()
    }
    
    func setup() {
        let userDef = UserDefaults.standard
        if let value = userDef.value(forKey: "unit") as? String {
            lastSelectedUnit = Unit(rawValue: value)
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewConroller" {
            prepareSegueForAddWeatherCityViewController(segue:segue)
        } else if segue.identifier == "SettingViewController" {
            prepareSegueForSettingTableViewController(segue: segue)
        }
    }
    
}

extension WeatherListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherListViewModel.numberOfRows(section: section)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCellView", for: indexPath) as! WeatherCellView
        let weatherVM = weatherListViewModel.modelAt(index: indexPath.row)
        cell.configure(vm: weatherVM)
        return cell
    }
    
}

extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(vm: vm)
        self.tableView.reloadData()
    }
    
    func prepareSegueForAddWeatherCityViewController(segue:UIStoryboardSegue) {
        guard let destination = segue.destination as? UINavigationController else {
            return
        }
        
        guard let addWeatherVC = destination.viewControllers.first as? AddWeatherCityViewController else {
            return
        }
        
        addWeatherVC.delegate = self
    }
    
    func prepareSegueForSettingTableViewController(segue:UIStoryboardSegue) {
        guard let destination = segue.destination as? UINavigationController else {
            return
        }
        
        guard let settingVC = destination.viewControllers.first as? SettingTableViewController else {
            return
        }
        
        settingVC.delegate = self
    }
}

extension WeatherListTableViewController: SettingDelegate {
    func settingsDone(vm: SettingsViewModel) {
        if lastSelectedUnit != vm.selectedUnit {
            weatherListViewModel.updateUnit(to: vm.selectedUnit)
            tableView.reloadData()
            lastSelectedUnit = Unit(rawValue: vm.selectedUnit.rawValue)
        }
    }
    
    
}
