//
//  InventoryTableViewController.swift
//  Totes
//
//  Created by Moses on 6/2/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase
/*
 
 Let's replace this entire setup with a tableview inside of a ViewController so that we can use multiple views in the same view controller
 
 */
class InventoryTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    
    // MARK: - Properties
    let inventory: [String] = ["company culture", "goggle rentals", "sunglasses", "towels"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
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
