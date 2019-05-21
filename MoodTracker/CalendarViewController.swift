//
//  CalendarViewController.swift
//  MoodTracker
//
//  Created by Bailey Carlson on 5/14/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var Calendar: UICollectionView!
    var currentMonth = String()
    var NumberOfEmptyBox = Int()
    var nextNumberOfEmptyBox = Int()
    var previousNumberOfEmptyBox = 0
    var direction = 0
    var positionIndex = 0
    var chosenDay: Int!
    var chosenColor: UIColor!
    var chosenMonth: Int!
    var chosenYear: Int!
    var moodDetails: String!
    var moods: [Int: Mood] = [:]
    let moodColors: [String: UIColor] = ["Angry": UIColor.init(red: 255, green: 0, blue: 0, alpha: 100), "Sad": UIColor.init(red: 0, green: 122, blue: 255, alpha: 100)]
    
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    let daysOfMonth = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    var daysInMonths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    override func viewDidLoad() {
        
        Calendar.delegate = self
        Calendar.dataSource = self
        super.viewDidLoad()
        currentMonth = months[chosenMonth - 1]
        month = chosenMonth
        year = chosenYear
        monthLabel.text = "\(currentMonth) \(year)"
        getStartDayPosition()
    }
    override func viewWillAppear(_ animated: Bool) {
        retrieveMoods()
        
        var retrievedMood: Mood
        if let object = UserDefaults.standard.data(forKey: "newMood"){
            if let objectDecoded = try?JSONDecoder().decode(Mood.self, from: object) as Mood {
                if objectDecoded.mood != "" {
                    retrievedMood = objectDecoded
                    let retrievedDate = Int(retrievedMood.day)
                    moods[retrievedDate] = retrievedMood
                }
            }
        }
        Calendar.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveMoods()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        switch currentMonth {
        case "January":
            direction = -1
            getStartDayPosition()
            month = 12
            year -= 1
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            direction = -1
            getStartDayPosition()
            month -= 1
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        switch currentMonth {
        case "December":
            direction = 1
            getStartDayPosition()
            month = 1
            year += 1
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
            
        default:
            direction = 1
            getStartDayPosition()
            month += 1
            currentMonth = months[month - 1]
            monthLabel.text = "\(currentMonth) \(year)"
            Calendar.reloadData()
        }
    }
    
    func getStartDayPosition() {
        checkForLeapYear()
        switch direction{
        case 0:
            NumberOfEmptyBox = (35 - abs(weekday - day))%7
            positionIndex = NumberOfEmptyBox
        case 1...:
            nextNumberOfEmptyBox = (positionIndex + daysInMonths[month - 1])%7
            positionIndex = nextNumberOfEmptyBox
        case -1:
            previousNumberOfEmptyBox = (7 - ((7 - positionIndex) + daysInMonths[(month + 22)%12])%7)
            if previousNumberOfEmptyBox == 7 {
                previousNumberOfEmptyBox = 0
            }
            positionIndex = previousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func checkForLeapYear() {
        if year%4 == 0 && year%100 != 0 {
            daysInMonths[1] = 29
        }
        else if year%400 == 0 {
            daysInMonths[1] = 29
        }
        else {
            return
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch direction {
        case 0:
            return daysInMonths[month - 1] + NumberOfEmptyBox
        case 1...:
            return daysInMonths[month - 1] + nextNumberOfEmptyBox
        case -1:
            return daysInMonths[month - 1] + previousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = .clear
        
        if cell.isHidden {
            cell.isHidden = false
        }
        switch direction {
        case 0:
            cell.dateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.dateLabel.text = "\(indexPath.row + 1 - nextNumberOfEmptyBox)"
        case -1:
            cell.dateLabel.text = "\(indexPath.row + 1 - previousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        if Int(cell.dateLabel.text!)! < 1 {
            cell.isHidden = true
        }
        //        if Int(cell.dateLabel.text!)! == chosenDay && currentMonth == months[chosenMonth - 1] && year == chosenYear {
        //            cell.backgroundColor = chosenColor
        //        }
        let mood = moods[indexPath.row]
        let moodName = mood?.mood
        cell.backgroundColor = moodColors["\(moodName)"]
        
        return cell
    }
    func saveMoods() {
        if let encoded = try? JSONEncoder().encode(moods) {
            UserDefaults.standard.set(encoded, forKey: "Moods")
        }
    }
    func retrieveMoods() {
        if let object = UserDefaults.standard.data(forKey: "Moods"){
            if let objectDecoded = try?JSONDecoder().decode([Int: Mood].self, from: object) as [Int: Mood] {
                moods = objectDecoded
                Calendar.reloadData()
            }
        }
    }
}

