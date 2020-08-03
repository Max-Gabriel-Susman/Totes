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
    let mockDataru = ["Prometheus" : ["password" : "Moses1998!", "email" : "gabe.susman@gmail.com"], "NobodyHome" : ["password" : "Susman1998!", "email" : "gaebster7@gmail.com"]]

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
        
        emailEntryPromptLabel.text = ""
        usernameEntryPromptLabel.text = ""
        passwordConfirmationPromptLabel.text = ""
        passwordEntryPromptLabel.text = ""
        
        
        
        if email.count > 0 && password == passwordConfirmation && password.count >= 8 && username.count >= 8 {
            
            // The credentials passed the client side logic and are passed to serverside
            
            // Ensures username isn't already taken
            let usernames = mockDataru.keys
            
            for string in usernames {
                if string == username {
                    
                    usernameEntryPromptLabel.text = "Username is already taken"
                    clearTextFields()
                    
                }
            }
            
            // Ensures password is correct
            // we need to move this logic to loginVC
//            let actualPassword = mockDataru[username]?["password"] ?? ""
//            
//            if password == actualPassword  {
//                
//                // we need to navigate to the confirmation page
//                
//            } else {
//                
//                passwordEntryPromptLabel.text = "Password is incorrect"
//                clearTextFields()
//                
//            }
            
            
        } else {
            
            // The credentials failed the client side logic
            if email.count <= 0 {
                
                emailEntryPromptLabel.text = "The email address was invalid"
                clearTextFields()
                
            }
                    
            if password != passwordConfirmation {
                
                passwordConfirmationPromptLabel.text = "The two password fields didn't match"
                clearTextFields()
            }
            
            if password.count < 8 {
                
                passwordEntryPromptLabel.text = "Your password is too short"
                clearTextFields()
                print("I work")
                
            }
            
            if username.count < 8 {
                
                usernameEntryPromptLabel.text = "Your username is too short"
                clearTextFields()
                print("username work")
                
            }
        }
        
        
        
            
        
    }
    // fine as i
    
    
    @IBAction func forgottenPasswordButton(_ sender: Any) {
    }
    
    // MARK: - Helper Methods
    func clearTextFields() {
        emailAddressEntryTextField.text = ""
        usernameEntryTextField.text = ""
        passwordEntryTextField.text = ""
        passwordConfirmationTextField.text = ""
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
