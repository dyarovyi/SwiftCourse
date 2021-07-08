
import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ProgressView: UIProgressView!
    
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    var quizzBrain = QuizzBrain()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateQuestion()
        ProgressView.progress = 0
        ScoreLabel.text = "Score: " + String(quizzBrain.score)
    }

    @IBAction func ButtonPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!
        let userGotItRight: Bool = quizzBrain.checkAnswer(userAnswer)
        
        if userGotItRight
        {
            sender.backgroundColor = UIColor.green
            quizzBrain.scoreIncrease()
            ScoreLabel.text = "Score: " + String(quizzBrain.score)
        }
        else
        {
            sender.backgroundColor = UIColor.red
        }
        
        if quizzBrain.questionNumber+1 < quizzBrain.quizzQuestions.count
        {
            quizzBrain.questionNumber += 1
        }
        else
        {
            quizzBrain.questionNumber = 0
            ProgressView.progress = 0
            quizzBrain.score = 0
            ScoreLabel.text = "Score: " + String(quizzBrain.score)
        }
        
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
    }
    
    @objc func updateQuestion() -> Void
    {
        QuestionLabel.text = quizzBrain.getQuestion()
        
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
        
        ProgressView.progress += 1.0 / quizzBrain.getCount()
    }
}

