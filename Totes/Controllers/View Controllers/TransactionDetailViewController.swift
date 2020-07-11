//
//  TransactionDetailViewController.swift
//  Totes
//
//  Created by Moses on 6/30/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase

class TransactionDetailViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var transactionTypeLabel: UILabel!
    @IBOutlet weak var agentNameLabel: UILabel!
    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var noteTextView: UITextView!
  
    
    // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
