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
    // this value is due for a nameChange
    var quoteListener: ListenerRegistration!
    var sectionName: String?
    //var userID = user.userID
    var user: String = "user0"
    var FBsections: [String : Any] = [:]
    var sectionNames: [String] = []
    var sectionItemSelections: [Int] = []
    let segueIdentifier = "inventoryToSection"
    let cellReuseIdentifier = "showSection"
    // perhaps we can/should assign docRef here?
    //docRef = Firestore.firestore().document("/totes/usersMap/usersCollection/\(user)/")
    // MARK: - LifecycleMethods
    // I think we need to keep this, note entirely sure though
    // let's see
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        print("we're back agin")
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firestore path for db queries
        docRef = Firestore.firestore().document("/totes/usersMap/usersCollection/\(user)/")
        //docRef = Firestore.firestore().document("/totes/usersMap/usersCollection/\(userID)/")
        
        // Reads data from a given user document in Firestore
        // this value is due for a nameChange
        quoteListener = docRef.addSnapshotListener { (docSnapshot, error) in
        
            // Ensures the data captured isn't nil
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            
            // Creates a local object in which to store the data
            let myData = docSnapshot.data()
            
            // populates a local dictionary with data from the sections map
            self.FBsections = myData?["sections"] as? [String : Any] ?? [:]
            
            // populate arrays with the keys and values from the map
            for section in self.FBsections {
                self.sectionNames.append(section.key)
                self.sectionItemSelections.append(section.value as! Int)
            }
            
            // populates tableview with the data
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        quoteListener.remove()
    }
 
    // MARK: - Actions
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        
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
    
    // how should I implement this process for a regular view controller?
    // for some reason the data in the next table is reloaded twice and incorrectly, it seems to be coming from one off the two functions below this one
    // maybe the redundancy is here? yes
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // section is the object we're passing to SectionTableViewController to dictate which sections data it will be populated with
        self.sectionName = sectionNames[indexPath.row]
        
    }

    
    // MARK: - Navigation
    // a variable typed any must be casted prior to use
    // sectiontableview is still populating with old data needs a fix, rip
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SectionTableViewController
        {
            vc.sectionName = self.sectionName
        }
    }
} // END OF CLASS
