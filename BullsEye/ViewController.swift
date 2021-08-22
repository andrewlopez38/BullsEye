//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrew Lopez on 8/21/21.
//

import UIKit

class ViewController: UIViewController {

    //currentval is instance variable
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
}
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
}

    func startNewRound(){
        round+=1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    //line 29 is outlet delcaration to Hit Me button
    @IBAction func showAlert() {
        let difference = abs(targetValue-currentValue)
        let points = 100 - difference
        score += points
        let message = "You scored \(points) points"
    
          let alert = UIAlertController(
            title: "Hello, World",
            message: message,
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)

          alert.addAction(action)

          present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBOutlet var roundLabel:UILabel!
    @IBOutlet var scoreLabel:UILabel!
    @IBOutlet var targetLabel:UILabel!
    
    //parameter is inside parentheses following method
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }

 }

