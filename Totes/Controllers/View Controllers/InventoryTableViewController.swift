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
    
    // MARK: - Outlets
    
    
    // MARK: - Properties
    // we need to create the code to retrieve the actual document titles from cloud firestore
    var docRef: DocumentReference!
    var quoteListener: ListenerRegistration!
    var user: String = "user0"
    var inventory: [String] = []

    // MARK: - LifecycleMethods
    // I think we need to keep this, note entirely sure though
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        docRef = Firestore.firestore().document("/totes/usersMap/usersCollection/\(user)/")
        
        quoteListener = docRef.addSnapshotListener { (docSnapshot, error) in
        
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            
            let myData = docSnapshot.data()
            
            let sectionIDs = myData?["sectionIDs"] as? [String] ?? []
            
            self.inventory = sectionIDs
            // populates tableview with firestore data
            self.tableView.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        quoteListener.remove()
    }
    
    // MARK: - Actions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return inventory.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showSection", for: indexPath)
        
        let sectionName = inventory[indexPath.row]
        
        cell.textLabel?.text = sectionName

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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
} // END OF CLASS
