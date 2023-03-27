//
//  Double+Extension.swift
//  MVVM-Weather
//
//  Created by Raja Adeel Ahmed on 3/27/23.
//

import Foundation

extension Double {
    func formateAsDegree()->String {
        return String(format: "%.0f°",self)
    }
}
