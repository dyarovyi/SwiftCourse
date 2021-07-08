//
//  ViewController.swift
//  Tipsy
//
//  Created by Daniil Yarovyi on 6/2/21.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()
    
    var billTotal: Double?
    var tip: Double?
    var split: Int?
    
    var totalPerPerson: Double?

    @IBOutlet weak var splitLabel: UILabel!
    
    @IBOutlet weak var zeroButtonOutlet: UIButton!
    @IBOutlet weak var tenButtonOutlet: UIButton!
    @IBOutlet weak var twentyButtonOutlet: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func billTotalChanged(_ sender: UITextField) {
        billTotal = Double(sender.text!)
    }
    
    @IBAction func tipSelected(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        if sender.currentTitle == "0%" {
            tip = 0.0
            zeroButtonOutlet.isSelected = true
            tenButtonOutlet.isSelected = false
            twentyButtonOutlet.isSelected = false

        } else if sender.currentTitle == "10%" {
            tip = 0.1
            zeroButtonOutlet.isSelected = false
            tenButtonOutlet.isSelected = true
            twentyButtonOutlet.isSelected = false
            
        } else {
            tip = 0.2
            zeroButtonOutlet.isSelected = false
            tenButtonOutlet.isSelected = false
            twentyButtonOutlet.isSelected = true

        }
    }
    
    @IBAction func splitChanged(_ sender: UIStepper) {
        billTextField.endEditing(true)
        
        splitLabel.text = String(format: "%.0f", sender.value)
        split = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateTotalPerPerson(billTotal: billTotal ?? 0.0, tip: tip ?? 0.0, split: split ?? 1)
        totalPerPerson = calculatorBrain.getTotalPerPerson()
        print(calculatorBrain.getTotalPerPerson())
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.totalPerPerson = calculatorBrain.getTotalPerPerson()
            destinationVC.tip = (tip ?? 0.0) * 100
            destinationVC.split = split ?? 1
        }
    }
    
}

