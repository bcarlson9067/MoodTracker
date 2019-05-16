//
//  Mood.swift
//  MoodTracker
//
//  Created by Caroline Lubbe on 5/16/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import Foundation

class Mood: Codable {
    var mood: String!
    var moodDetails: String!
    var datePickerDate: Date!
    var day: Int!
    var month: Int!
    var year: Int!
    
    init(mood: String, moodDetails: String, datePickerDate: Date, day: Int, month: Int, year: Int) {
        self.mood = mood
        self.moodDetails = moodDetails
        self.datePickerDate = datePickerDate
        self.day = day
        self.month = month
        self.year = year
    }
    
    enum CodingKeys: String, CodingKey {
        case mood
        case moodDetails
        case datePickerDate
        case day
        case month
        case year
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mood = try container.decode(String.self, forKey: .mood)
        moodDetails = try container.decode(String.self, forKey: .moodDetails)
        datePickerDate = try container.decode(Date.self, forKey: .datePickerDate)
        day = try container.decode(Int.self, forKey: .day)
        month = try container.decode(Int.self, forKey: .month)
        year = try container.decode(Int.self, forKey: .year)
    }
    
    func encode(to encoder: Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        try encodeContainer.encode(mood, forKey: .mood)
        try encodeContainer.encode(moodDetails, forKey: .moodDetails)
        try encodeContainer.encode(datePickerDate, forKey: .datePickerDate)
        try encodeContainer.encode(day, forKey: .day)
        try encodeContainer.encode(month, forKey: .month)
        try encodeContainer.encode(year, forKey: .year)
    }
}
