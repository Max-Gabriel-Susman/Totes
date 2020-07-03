//
//  SectionTableViewController.swift
//  Totes
//
//  Created by Moses on 6/2/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    
    // MARK: - Properties
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // MARK: - Actions
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showItem", for: indexPath)

        // Configure the cell...

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
} // END OF CLASS
