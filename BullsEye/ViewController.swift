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
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

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
   
    func startNewGame() {
      score = 0
      round = 0
      startNewRound()
    }

    //line below is outlet delcaration to Hit Me button
    @IBAction func showAlert() {
        let difference = abs(targetValue-currentValue)
        var points = 100 - difference
       
          let title: String
          if difference == 0 {
            title = "Perfect!"
            points += 100
          } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
          } else if difference < 10 {
            title = "Pretty good!"
          } else {
            title = "Not even close...."
          }
        score += points
        let message = "You scored \(points) points"
    
          let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",
            //closure is written outside method = syntactic sugar
            style: .default) { _ in
                self.startNewRound()
            //trailing closure with handler could be entered here. use preference
            }

          alert.addAction(action)

          present(alert, animated: true, completion: nil)
     
        
    }
    
    @IBOutlet var roundLabel:UILabel!
    @IBOutlet var scoreLabel:UILabel!
    @IBOutlet var targetLabel:UILabel!
    
    //parameter is inside parentheses following method
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
        //last update
        
    }

 }

