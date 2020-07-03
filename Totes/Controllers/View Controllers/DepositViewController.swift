//
//  DepositViewController.swift
//  Totes
//
//  Created by Moses on 6/30/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit

class DepositViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var categoryEntryTextField: UITextField!
    @IBOutlet weak var itemEntryTextField: UITextField!
    @IBOutlet weak var quantityTypePickerView: UIPickerView!
    @IBOutlet weak var quantityEntryTextField: UITextField!
    @IBOutlet weak var noteEntryTextView: UITextView!
    
    // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func depositButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
