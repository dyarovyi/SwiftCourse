//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by Daniil Yarovyi on 6/2/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    mutating func calculateBMI(height: Float, weight: Float) -> Void {
        let bmiValue = weight / (height * height)
        var bmiAdvice: String
        var bmiColor: UIColor
        
        if bmiValue < 18.5 {
            bmiAdvice = "Underweight"
            bmiColor = UIColor.blue
        } else if bmiValue >= 18.5 && bmiValue < 24.9 {
            bmiAdvice = "Normal"
            bmiColor = #colorLiteral(red: 0.1828772426, green: 0.6749802828, blue: 0.4051103592, alpha: 1)
        } else {
            bmiAdvice = "Overweight"
            bmiColor = UIColor.red
        }
        
        print(bmiAdvice)
        bmi = BMI(value: bmiValue, advice: bmiAdvice, color: bmiColor)
    }
    
    func getBMIValue() -> String {
        return String(format: "%.1f", bmi?.value ?? 0.0)
    }
    
    func getBMIAdvice() -> String {
        return bmi?.advice ?? ""
    }
    
    func getBMIColor() -> UIColor {
        return bmi?.color ?? UIColor.black
    }
}
