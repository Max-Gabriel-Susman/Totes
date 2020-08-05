//
//  InventoryTableViewController.swift
//  Totes
//
//  Created by Moses on 6/2/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase


class InventoryTableViewController: UITableViewController {
    // MARK: - Properties
    //var user: User?
    var docRef: DocumentReference!
    var userBase: CollectionReference!  
    // this value is due for a nameChange
    var inventoryListener: ListenerRegistration!
    var sectionName: String?
    //var userID = user.userID
    var user: String? 
    var FBsections: [String : Any] = [:]
    var sectionNames: [String] = []
    var sectionItemSelections: [Int] = []
    let segueIdentifier = "inventoryToSection"
    let cellReuseIdentifier = "showItem"
    
    // MARK: - LifecycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("This is the user: \(user ?? "")")
        
        userBase = Firestore.firestore().collection("/totes/usersMeta/userbase")
                
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //inventoryListener.remove()
    }
 
    // MARK: - Actions
    @IBAction func accountButtonTapped(_ sender: Any) {
        
        print("THis be ye user : \(user ?? "")")
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let sectionName = sectionNames[indexPath.row]
        
        let sectionItemSelection = sectionItemSelections[indexPath.row]
        
        cell.textLabel?.text = sectionName
        
        cell.detailTextLabel?.text = "\(sectionItemSelection)"

        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // section is the object we're passing to SectionTableViewController to dictate which sections data it will be populated with
        //self.sectionName = sectionNames[indexPath.row]
        
    }

    
    // MARK: - Navigation
    // a variable typed any must be casted prior to use
    // sectiontableview is still populating with old data needs a fix, rip
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? ItemTableViewController
//        {
//            vc.sectionName = self.sectionName
//        }
    }
} // END OF CLASS
