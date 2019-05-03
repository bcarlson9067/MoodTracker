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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func whenRedButtonPressed(_ sender: Any) {
        mood = "Angry"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenOrangeButtonPressed(_ sender: Any) {
        mood = "Excited"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenYellowButtonPressed(_ sender: Any) {
        mood = "Happy"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenGreenButtonPressed(_ sender: Any) {
        mood = "Jealous"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenBlueButtonPressed(_ sender: Any) {
        mood = "Sad"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenPurpleButtonPressed(_ sender: Any) {
        mood = "Productive"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenPinkButtonPressed(_ sender: Any) {
        mood = "Calm"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    @IBAction func whenBlackButtonPressed(_ sender: Any) {
        mood = "Dead"
        performSegue(withIdentifier: "moodSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! DetailsViewController
        dvc.mood = mood
    }
    
}

