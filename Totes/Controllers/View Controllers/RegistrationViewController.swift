//
//  RegistrationViewController.swift
//  Totes
//
//  Created by Moses on 6/30/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    // MARK: - Outlets
    // pretty sure this guys wrong, going to fix later
    @IBOutlet weak var emailAddressEntryTextField: UITextField!
    @IBOutlet weak var usernameEntryTextField: UITextField!
    @IBOutlet weak var passwordEntryTextField: UITextField!
    
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    // I need to add the logic to create a user in the firestore db using this action
    @IBAction func registerButton(_ sender: Any) {
        // casts email username and password text field optionals as strings and ensures they meet reqs
        // what is best practice for determining a valid email?
        // we also need to query the db and ensure accounts with this username and or email don't already exist on record
        guard let email = emailAddressEntryTextField.text as? String, email != "", let username = usernameEntryTextField.text as? String, username.count >= 8, let password = passwordEntryTextField.text as? String, password.count >= 8 else { return }
        
        print(email)
        print(username)
        print(password)
        // we need visual feedback for when the user enters the wrong email
    }
    // fine as i
    @IBAction func forgottenPasswordButton(_ sender: Any) {
    }
    

    // we need to do a conditional segue to the email verification view controller

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // "Framework not found GoogleAppMeasurement"
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? EmailVerificationViewController
//        {
//
//        }
//    }

}
