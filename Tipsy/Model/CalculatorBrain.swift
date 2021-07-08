//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Daniil Yarovyi on 6/2/21.
//

import Foundation

struct CalculatorBrain {
    
    var totalPerPerson: Double?
    
    mutating func calculateTotalPerPerson(billTotal: Double, tip: Double, split: Int) {
        totalPerPerson = (billTotal + (billTotal * tip)) / Double(split)
    }
    
    func getTotalPerPerson() -> Double {
        return totalPerPerson ?? 0.0
    }
}
