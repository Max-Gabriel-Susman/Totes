//
//  SectionTableViewController.swift
//  Totes
//
//  Created by Moses on 6/2/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase

class SectionTableViewController: UITableViewController {
    
    // MARK: - Properties
    var section: Section?
    var sectionName: String?
    var docRef: DocumentReference!
    var quoteListener: ListenerRegistration!
    var user: String = "user0"
    // I think we might end up not actually needing sections
    var sections: [String] = []
    var itemNames: [String] = []
    var itemQuantities: [Int] = []

    // MARK: - LifecycleMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assigns a string passed from InventorytableviewController to the sectionName property of the local section object
        setSection()
        
        // Firestore path for db queries
        docRef = Firestore.firestore().document("/totes/usersMap/usersCollection/\(user)/")
        
        // Reads data from a given user document in Firestore
        quoteListener = docRef.addSnapshotListener { (docSnapshot, error) in
        
            // Ensures the data captured isn't nil
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            
            // Creates a local object in which to store the data
            let myData = docSnapshot.data()
            
            // populates a local dictionary with data from the sections map
            let section0 = myData?["section0"] as? [String : Any] ?? [:]
            let name = section0["name"] as? String ?? ""
            let items = section0["items"] as? [String : Int] ?? [:]
            print(name)
            
            
            // populate arrays with the keys and values from the map
            for item in items {
                self.itemNames.append(item.key)
                self.itemQuantities.append(item.value)
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
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showItem", for: indexPath)
        
        let itemName = itemNames[indexPath.row]

        let itemQuantity = itemQuantities[indexPath.row]

        cell.textLabel?.text = itemName

        cell.detailTextLabel?.text = "\(itemQuantity)"

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
    
    // MARK: - HelperMethods
    func setSection() {
        guard let sectionName = section?.sectionName else { return }
        print("\(sectionName) is aquired.")
    }
    
} // END OF CLASS
