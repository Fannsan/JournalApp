//
//  Journal.swift
//  myJornalApp
//
//  Created by Fanny on 2023-09-07.
//

import Foundation

class Journal{
    
    
   private var entrys: [JournalEntry]
    
    init() {
        //skapar en tom array till att börja med med en init(konstruktor)
        self.entrys = [JournalEntry(title: "Exempel", date: Date(), notes: "Hej")]
    }
    
    func getEntrysCount() -> Int{
        return entrys.count
    }
    
    //hämtar en entry på indexet
    func getEntry(atIndex index: Int) -> JournalEntry {

        return entrys[index]

    }
    
    
    func addEntry(newEntry: JournalEntry){
        //lägger till en ny journal entry i vår array
        entrys.append(newEntry)
    }
}
