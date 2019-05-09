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
        self.getStartedButton.layer.cornerRadius = 22
        

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
