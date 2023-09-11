//
//  AddEntryViewController.swift
//  myJornalApp
//
//  Created by Fanny on 2023-09-07.
//

import UIKit

class AddEntryViewController: UIViewController {

    @IBOutlet weak var txtTitle: UITextField!
    
    @IBOutlet weak var switchDate: UISwitch!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var txtNotes: UITextView!
    
    
    var myJournal: Journal?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSwitchDate(_ sender: Any) {
        
        if switchDate.isOn{
            //show datepicker
            datePicker.isHidden = false
        }else{
            datePicker.isHidden = true
        }
    }
    
    
    @IBAction func save(_ sender: Any) {
        
        //kollar så titel och notes inte är nil
        guard let title = txtTitle.text,
              let notes = txtNotes.text else{
                  return
              }
        
        let newEntry = JournalEntry(title: title, date: switchDate.isOn ? datePicker.date : Date(), notes: notes)
          
        myJournal?.addEntry(newEntry: newEntry)
        
        self.navigationController?.popViewController(animated: true)
        
//        if switchDate.isOn{
//            //skapa en journal entry med eget datum
//            let newEntry = JournalEntry(title: title, date: datePicker.date, notes: notes)
//
//            myJournal?.addEntry(newEntry: newEntry)
//
//            //här plockar vi bort från stacken så vi kommer tillaks
//            self.navigationController?.popViewController(animated: true)
//
//        } else {
//            //skapa dagens datum
//
//            let newEntry = JournalEntry(title: title, date: Date(), notes: notes)
//
//            myJournal?.addEntry(newEntry: newEntry)
//
//            //här plockar vi bort från stacken så vi kommer tillaks
//            self.navigationController?.popViewController(animated: true)
//        }
        
        
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
