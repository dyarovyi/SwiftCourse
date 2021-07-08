//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Daniil Yarovyi on 6/2/21.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalPerPerson: Double?
    var tip: Double?
    var split: Int?
    
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        totalPerPersonLabel.text = String(format: "%.2f", totalPerPerson ?? 0.0)
        infoLabel.text = "Split between " + String(format: "%d", split ?? 0) + " people with " + String(format: "%.0f", tip ?? 0.0) + "% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
