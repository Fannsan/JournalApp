//
//  TableViewController.swift
//  myJornalApp
//
//  Created by Fanny on 2023-09-07.
//

import UIKit

class TableViewController: UITableViewController {

    
    let JOURNAL_IDENTIFIER = "journalCell"
    
    let myJournal = Journal()
    
    let segueToAdd = "segueToAdd"
    
    let segueToViewEntry = "segueViewEntry"
    
    @IBOutlet var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    //varje gång vår vy kommer tillbaks laddar vi om den
    override func viewDidAppear(_ animated: Bool) {
        myTableView.reloadData()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myJournal.getEntrysCount()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JOURNAL_IDENTIFIER, for: indexPath)

        // Configure the cell...

        var content = cell.defaultContentConfiguration()
        
        //här hämtar vi anteckningen
        let entry = myJournal.getEntry(atIndex: indexPath.row)
        
        //här plockar vi ut titeln
        content.text = "\(entry.date) \(entry.title)"
        
        //sätter in i cellen
        cell.contentConfiguration = content
        
        return cell
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == segueToAdd {
            if let destinationVC = segue.destination as? AddEntryViewController{
                destinationVC.myJournal = self.myJournal
            }
            return
        }
        
       
        
        if segue.identifier == segueToViewEntry{
            
            
            guard let destinationVC = segue.destination as? EntryViewController else{return}
            
            guard let cell = sender as? UITableViewCell else {return}
            
            guard let indexPath = myTableView.indexPath(for: cell) else {return}
           
            let entry = myJournal.getEntry(atIndex: indexPath.row)
            destinationVC.entry = entry
            
//            if let destinationVC = segue.destination as? EntryViewController{
//
//                //Om sender är en cell skapar vi variabeln cell och kör koden
//                if let cell = sender as? UITableViewCell{
//
//                    if let indexPath = myTableView.indexPath(for: cell){
//                        let entry = myJournal.getEntry(atIndex: indexPath.row)
//                        destinationVC.entry = entry
//                    }
//                }
//
//            }
        }
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation


    */

}
