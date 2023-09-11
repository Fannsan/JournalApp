//
//  EntryViewController.swift
//  myJornalApp
//
//  Created by Fanny on 2023-09-11.
//

import UIKit

class EntryViewController: UIViewController {
    
    @IBOutlet weak var lblEntryTitle: UILabel!
    
    @IBOutlet weak var lblEntryDate: UILabel!
    
    @IBOutlet weak var txtEntryContent: UITextView!
    
    var entry: JournalEntry?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let entry = entry {
            lblEntryTitle.text = entry.title
            lblEntryDate.text = entry.date
            txtEntryContent.text = entry.notes
        }
       
    }
    


}
