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
    @IBOutlet weak var emailEntryPromptLabel: UILabel!
    @IBOutlet weak var usernameEntryPromptLabel: UILabel!
    @IBOutlet weak var passwordEntryPromptLabel: UILabel!
    @IBOutlet weak var passwordConfirmationPromptLabel: UILabel!
    
    @IBOutlet weak var emailAddressEntryTextField: UITextField!
    @IBOutlet weak var usernameEntryTextField: UITextField!
    @IBOutlet weak var passwordEntryTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    // I need to add the logic to create a user in the firestore db using this action
    @IBAction func registerButton(_ sender: Any) {
        
        // Unwraps the TextFields content into local Strings
        let email = emailAddressEntryTextField.text ?? ""
        let username = usernameEntryTextField.text ?? ""
        let password = passwordEntryTextField.text ?? ""
        let passwordConfirmation = passwordConfirmationTextField.text ?? ""
        
        if email.count <= 0 {
            
            emailEntryPromptLabel.text = "The email address was invalid"
            failedRegistration()
            
        }
                
        if password != passwordConfirmation {
            
            passwordConfirmationPromptLabel.text = "The two password fields didn't match"
            failedRegistration()
        }
        
        if password.count < 8 {
            
            passwordEntryPromptLabel.text = "Your password is too short"
            failedRegistration()
            print("I work")
            
        }
        
        if username.count < 8 {
            
            usernameEntryPromptLabel.text = "Your username is too short"
            failedRegistration()
            print("username work")
            
        }
            
        usernameEntryPromptLabel.text = ""
        print(email)
        print(username)
        print(password)
        let usernames: [String] = ["Prometheus", "Nobody"]
            
        
    }
    // fine as i
    func failedRegistration() {
        emailAddressEntryTextField.text = ""
        usernameEntryTextField.text = ""
        passwordEntryTextField.text = ""
        passwordConfirmationTextField.text = ""
    }
    
    @IBAction func forgottenPasswordButton(_ sender: Any) {
    }
    
    // We may implement these later but lets leave it out for simplicity's sake
//    func validEmailAddress() -> Bool {
//
//        for char in email {
//            if char == "@" {
//                return true
//            }
//        }
//
//        return false
//    }
//    func invalidCharacters(string: String) -> Bool {
//
//        for char in string {
//            if char == " " {
//                return true
//            }
//        }
//
//        return false
//    }
    

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
