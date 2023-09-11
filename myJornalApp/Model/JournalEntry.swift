//
//  JournalEntry.swift
//  myJornalApp
//
//  Created by Fanny on 2023-09-07.
//

import Foundation

//Struct som innehåller variabler för vår dagbok
struct JournalEntry{
    
    var dateFormater = DateFormatter()
    var title: String
    var rawDate: Date
    var notes: String
    
    //formaterar date 
    var date: String {
        return dateFormater.string(from: rawDate)
    }
    
    
    init(title: String, date: Date, notes: String) {
        
        dateFormater.dateFormat = "yyyy-MM-dd"
        
        self.title = title
        self.rawDate = date
        self.notes = notes
    }
    
}
