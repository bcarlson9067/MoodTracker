//
//  ViewController.swift
//  MoodTracker
//
//  Created by Bailey Carlson on 4/30/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit
import EventKit

class MoodChoiceViewController: UIViewController {
    
    var mood: String!
    var buttonColor: UIColor!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var pinkButton: UIButton!
    @IBOutlet weak var greyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.applyRoundCorner(whenRedButtonPressed as AnyObject)
        redButton.layer.cornerRadius = 22
        orangeButton.layer.cornerRadius = 22
        yellowButton.layer.cornerRadius = 22
        greenButton.layer.cornerRadius = 22
        blueButton.layer.cornerRadius = 22
        purpleButton.layer.cornerRadius = 22
        pinkButton.layer.cornerRadius = 22
        greyButton.layer.cornerRadius = 22
        
        // Do any additional setup after loading the view.
    }
    //function to make buttons round
    func applyRoundCorner(_ object: AnyObject) {
        object.layer?.cornerRadius = 22
        object.layer?.masksToBounds = true
    }
    @IBAction func whenRedButtonPressed(_ sender: UIButton) {
        mood = "Angry"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 255, G: 0, B: 0
    }
    
    @IBAction func whenOrangeButtonPressed(_ sender: UIButton) {
        mood = "Excited"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 255, G: 142, B: 0
    }
    
    @IBAction func whenYellowButtonPressed(_ sender: UIButton) {
        mood = "Happy"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 255, G: 255, B: 0
    }
    
    @IBAction func whenGreenButtonPressed(_ sender: UIButton) {
        mood = "Jealous"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 0, G: 165, B: 9
    }
    
    @IBAction func whenBlueButtonPressed(_ sender: UIButton) {
        mood = "Sad"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 0, G: 45, B: 255
    }
    
    @IBAction func whenPurpleButtonPressed(_ sender: UIButton) {
        mood = "Productive"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 169, G: 0, B: 223
    }
    
    @IBAction func whenPinkButtonPressed(_ sender: UIButton) {
        mood = "Calm"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is R: 255, G: 64, B: 192
    }
    
    @IBAction func whenGreyButtonPressed(_ sender: UIButton) {
        mood = "Dead"
        buttonColor = sender.backgroundColor
        performSegue(withIdentifier: "moodSegue", sender: nil)
        // button color is 50% grayscale slider
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        dvc.mood = mood
        dvc.buttonColor = buttonColor
    }
    
}

