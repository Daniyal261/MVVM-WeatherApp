//
//  SettingVIewModelTests.swift
//  MVVM-WeatherTests
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import XCTest
@testable import MVVM_Weather

class SettingViewModelTests: XCTestCase {

    private var settingsVM:SettingsViewModel!
    
    override func setUp() {
        super.setUp()
        self.settingsVM = SettingsViewModel()
    }
    
    func test_should_default_fahrenheit() {
        XCTAssertEqual(settingsVM.selectedUnit, .celsius)
    }
    
    override func tearDown() {
        super.tearDown()
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "unit")
    }

}
