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
    var stringDate: String!
    var chosenMonth: String!
    var datePickerDate: Date!
    var day: Int!
    var month: Int!
    var year: Int!
    var newMood: Mood!
    var moodDetails: String!
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodLabel.text = mood
        moodLabel.backgroundColor = buttonColor
        moodLabel.layer.shadowColor = UIColor.black.cgColor
        moodLabel.layer.shadowRadius = 4
        moodLabel.layer.shadowOpacity = 0.5
        moodLabel.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.moodLabel.layer.cornerRadius = 22
        moodLabel.clipsToBounds = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        stringDate = formatter.string(from: datePicker.date)
    }
    
    @IBAction func whenAddButtonPressed(_ sender: Any) {
        //        for month in months {
        //            if stringDate.contains(month) {
        //                chosenMonth = month
        //                print(chosenMonth!)
        //            }
        //        }
        if detailsTextField.text != nil {
            moodDetails = detailsTextField.text
        } else {
            moodDetails = "No details added"
        }
        detailsTextField.resignFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue , sender: Any?) {
        if segue.identifier == "detailsToCalendarSegue" {
        let nvc = segue.destination as! CalendarViewController
        datePickerDate = datePicker.date
        day = calendar.component(.day, from: datePickerDate)
        month = calendar.component(.month, from: datePickerDate)
        year = calendar.component(.year, from: datePickerDate)
        nvc.chosenDay = day
        nvc.chosenColor = buttonColor
        nvc.moodDetails = moodDetails
        nvc.chosenMonth = month
        nvc.chosenYear = year
        if let newMoodName = mood, let newMoodDetails = moodDetails, let newMoodDate = datePickerDate, let newMoodDay = day, let newMoodMonth = month, let newMoodYear = year {
            newMood = Mood(mood: newMoodName, moodDetails: newMoodDetails, datePickerDate: newMoodDate, day: newMoodDay, month: newMoodMonth, year: newMoodYear)
        }
    }
        func viewWillDisappear(_ animated: Bool) {
        if let encoded = try?JSONEncoder().encode(newMood) {
            UserDefaults.standard.set(encoded, forKey: "newMood")
        }
    }
}
}
