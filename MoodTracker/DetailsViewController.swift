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
    var datePickerMonth: Int!
    var year: Int!
    
    let months: [String] = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var detailsTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        moodLabel.text = mood
        moodLabel.backgroundColor = buttonColor

        // Do any additional setup after loading the view.
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .none
        stringDate = formatter.string(from: datePicker.date)
    }
    
    @IBAction func whenAddButtonPressed(_ sender: Any) {
        for month in months {
            if stringDate.contains(month) {
                chosenMonth = month
                print(chosenMonth!)

            }
        }
        detailsTextField.resignFirstResponder()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let nvc = segue.destination as! CalendarViewController
        datePickerDate = datePicker.date
        day = calendar.component(.day, from: datePickerDate)
        datePickerMonth = calendar.component(.month, from: datePickerDate)
        year = calendar.component(.year, from: datePickerDate)
        nvc.chosenDay = day
        nvc.chosenColor = buttonColor
        nvc.chosenMonth = datePickerMonth
        nvc.chosenYear = year
    }
}
