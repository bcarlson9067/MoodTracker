//
//  DetailsViewController.swift
//  MoodTracker
//
//  Created by Caroline Lubbe on 5/3/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var mood: String!
    var buttonColor: UIColor!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodLabel.text = mood
        moodLabel.backgroundColor = buttonColor

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
