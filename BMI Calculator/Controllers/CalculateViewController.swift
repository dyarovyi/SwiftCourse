
import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var currentHeight: UILabel!
    @IBOutlet weak var currentWeight: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightSlider: UISlider!
    
    var calculatorBrain = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightSlider.value = 1.50
        weightSlider.value = 100
        
        currentHeight.text = String(format: "%.2fm", heightSlider.value)
        currentWeight.text = String(format: "%.0fKg", weightSlider.value)
        
    }

    @IBAction func heigthValueChanged(_ sender: UISlider) {
        let height = sender.value
        currentHeight.text = String(format: "%.2fm", height)
    }
    
    @IBAction func weightValueChanged(_ sender: UISlider) {
        let weight = sender.value
        currentWeight.text = String(format: "%.0fKg", weight)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.bmiAdvice = calculatorBrain.getBMIAdvice()
            destinationVC.bmiColor = calculatorBrain.getBMIColor()
        }
    }
}

