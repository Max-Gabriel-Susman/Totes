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
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var welcomeBackLabel: UILabel!
    
    
    // MARK: - Properties
    var userRef: DocumentReference!
    var userBase: CollectionReference!
    var inventoryListener: ListenerRegistration!
    var inventoryName: String?
    var user: String? 
    var inventories: [String : Any] = [:]
    var inventoryNames: [String] = []
    var inventorySelections: [Int] = []
    let segueIdentifier = "inventoryToItem"
    let cellReuseIdentifier = "showItem"
    
    // MARK: - LifecycleMethods
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        
////        inventoryListener = userBase.addSnapshotListener { (docSnapshot, error) in
////        guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
////        let myData = docSnapshot.data()
//        
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeBackLabel.text = user ?? ""
        userBase = Firestore.firestore().collection("/totes/usersMeta/userbase")
                
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        inventoryListener.remove()
    }
 
    // MARK: - Actions
    @IBAction func settingsButtonTapped(_ sender: Any) {
    }
    @IBAction func editInfoButtonTapped(_ sender: Any) {
    }
    @IBAction func contactsButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryNames.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        
        let inventoryName = inventoryNames[indexPath.row]
        
        let inventorySelection = inventorySelections[indexPath.row]
        
        cell.textLabel?.text = inventoryName
        
        cell.detailTextLabel?.text = "\(inventorySelection)"

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
        self.inventoryName = inventoryNames[indexPath.row]
        
    }

    
    // MARK: - Navigation
    // a variable typed any must be casted prior to use
    // sectiontableview is still populating with old data needs a fix, rip
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ItemTableViewController
        {
            vc.inventoryName = self.inventoryName
        }
    }
} // END OF CLASS
