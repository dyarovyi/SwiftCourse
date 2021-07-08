//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var label: UILabel!
    
    var storyBrain = StoryBrain()
    
    func updateUI()-> Void
    {
        label.text = storyBrain.stories[storyBrain.step].title
        choice1.setTitle(storyBrain.stories[storyBrain.step].choice1, for: .normal)
        choice2.setTitle(storyBrain.stories[storyBrain.step].choice2, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    
    @IBAction func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
    
}

#imageLiteral(resourceName: "simulator_screenshot_BFB62277-9DED-4D69-8463-839128DF21E7.png")
