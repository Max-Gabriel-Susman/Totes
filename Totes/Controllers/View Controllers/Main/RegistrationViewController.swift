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
    var isValidRegistry = false
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
        
        
        // Performs client side checks on registered credentials
        if email.count > 0 && password == passwordConfirmation && password.count >= 8 && username.count >= 8 {
            
            // Pulls username collection from the server
            let usernames = mockDataru.keys
            
            // Checks for duplicate username value server side & manages UIElement content
            for string in usernames {
                if string == username {
                    
                    usernameEntryPromptLabel.text = "Username is already taken"
                    clearTextFields()
                    break
                    
                }
            }
            
            isValidRegistry = true
        // Invalid Credential registry branch
        } else {
            
            // Invalid email address branch
            if email.count <= 0 {
                
                emailEntryPromptLabel.text = "The email address was invalid"
                clearTextFields()
                
            }
            
            // Failed password confirmation branch
            if password != passwordConfirmation {
                
                passwordConfirmationPromptLabel.text = "The two password fields didn't match"
                clearTextFields()
            }
            
            // Invalid password branch
            if password.count < 8 {
                
                passwordEntryPromptLabel.text = "Your password is too short"
                clearTextFields()
                print("I work")
                
            }
            
            // Invalid username branch
            if username.count < 8 {
                
                usernameEntryPromptLabel.text = "Your username is too short"
                clearTextFields()
                print("username work")
                
            }
        }
    }
    
    @IBAction func forgottenPasswordButton(_ sender: Any) {
    }
    
    // MARK: - Helper Methods
    func clearTextFields() {
        emailAddressEntryTextField.text = ""
        usernameEntryTextField.text = ""
        passwordEntryTextField.text = ""
        passwordConfirmationTextField.text = ""
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // allows navigation in the event of successful authentication
        if identifier == "regisrationToEmailVerification" && isValidRegistry == true {
            
            return true
            
        } else {
            
            return false
            
        }
        
    }
}
