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
    var docRef: DocumentReference!
    var quoteListener: ListenerRegistration!
    var user: String = "user0"
    var FBsections: [String : Any] = [:]
    var sectionNames: [String] = []
    var sectionItemSelections: [Int] = []

    // MARK: - LifecycleMethods
    // I think we need to keep this, note entirely sure though
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Firestore path for db queries
        docRef = Firestore.firestore().document("/totes/usersMap/usersCollection/\(user)/")
        
        // Reads data from a given user document in Firestore
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
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
    // MARK: - Actions
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showSection", for: indexPath)
        
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
    
    // MARK: - Navigation
    // ok so I don't think we actually need all of this
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
////        if segue.identifier == "inventoryToSection" {
////
////            guard let index = tableView.indexPathForSelectedRow,
////
////            let destination = segue.destination as? SectionTableViewController else { return }
//        }
 //   }
} // END OF CLASS
