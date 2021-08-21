//
//  ViewController.swift
//  BullsEye
//
//  Created by Andrew Lopez on 8/21/21.
//

import UIKit

class ViewController: UIViewController {

    //currentval is instance variable
    var currentValue: Int = 0
    var targetValue = 0
    @IBOutlet var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
}
    func updateLabels() {
      targetLabel.text = String(targetValue)
}

    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels()
    }
    
    //line 29 is outlet delcaration to Hit Me button
    @IBAction func showAlert() {
          let message = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"

          let alert = UIAlertController(
            title: "Hello, World",
            message: message,    // changed
            preferredStyle: .alert)

          let action = UIAlertAction(
            title: "OK",          // changed
            style: .default,
            handler: nil)

          alert.addAction(action)

          present(alert, animated: true, completion: nil)
        startNewRound()
        
    }
    
    @IBOutlet var targetLabel:UILabel!
    
    //parameter is inside parentheses following method
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
        
    }

 }

