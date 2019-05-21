//
//  WelcomeViewController.swift
//  MoodTracker
//
//  Created by Grace Paulette on 5/9/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var moodTrackerLabel: UILabel!
    @IBOutlet weak var getStartedButton: UIButton!
    @IBOutlet weak var moodTrackerLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //button details
        self.getStartedButton.layer.cornerRadius = 22
        getStartedButton.layer.shadowColor = UIColor.black.cgColor
        getStartedButton.layer.shadowRadius = 4
        getStartedButton.layer.shadowOpacity = 0.5
        getStartedButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        //label details
        moodTrackerLabel.layer.shadowColor = UIColor.black.cgColor
        moodTrackerLabel.layer.shadowRadius = 4
        moodTrackerLabel.layer.shadowOpacity = 0.5
        moodTrackerLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        //image details
        moodTrackerLogo.layer.shadowColor = UIColor.black.cgColor
        moodTrackerLogo.layer.shadowRadius = 4
        moodTrackerLogo.layer.shadowOpacity = 0.5
        moodTrackerLogo.layer.shadowOffset = CGSize(width: 0, height: 0)

        // Do any additional setup after loading the view.
    }
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
