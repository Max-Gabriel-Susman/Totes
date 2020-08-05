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
    var isUniqueUsername = false
    let mockDataru = ["Prometheus" : ["password" : "Moses1998!", "email" : "gabe.susman@gmail.com"], "NobodyHome" : ["password" : "Susman1998!", "email" : "gaebster7@gmail.com"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    // I need to add the logic to create a user in the firestore db using this action
    // but first we need to persist registered users in the mock data
    @IBAction func registerButton(_ sender: Any) {
        
        // Unwraps the TextFields content into local Strings
        let email = emailAddressEntryTextField.text ?? ""
        let username = usernameEntryTextField.text ?? ""
        let password = passwordEntryTextField.text ?? ""
        let passwordConfirmation = passwordConfirmationTextField.text ?? ""
        
        // Resets the label values to empty
        clearLabels()
        
        
        
        if email.count > 0 && password == passwordConfirmation && password.count >= 8 && username.count >= 8 {
            
            isUniqueUsername = true
            
            for string in mockDataru.keys {
                
                if string == username {
                
                    print("username taken")
                    usernameEntryPromptLabel.text = "Username is already taken"
                    isUniqueUsername = false
                    
                }
            }
            
        // Invalid Credential registry branch
        } else {
            
            // Invalid email address branch
            if email.count <= 0 {
                
                emailEntryPromptLabel.text = "The email address was invalid"
                
            }
            
            // Failed password confirmation branch
            if password != passwordConfirmation {
                
                passwordConfirmationPromptLabel.text = "The two password fields didn't match"
                
            }
            
            // Invalid password branch
            if password.count < 8 {
                
                passwordEntryPromptLabel.text = "Your password is too short"
                
            }
            
            // Invalid username branch
            if username.count < 8 {
                
                usernameEntryPromptLabel.text = "Your username is too short"
                
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
    
    func clearLabels() {
        emailEntryPromptLabel.text = ""
        usernameEntryPromptLabel.text = ""
        passwordEntryPromptLabel.text = ""
        passwordConfirmationPromptLabel.text = ""
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // allows navigation in the event of successful authentication
        if identifier == "registrationToEmailVerification" && isUniqueUsername == true {
            
            return true
        
        // allows unconditional navigation to forgottenPassword vc
        } else if identifier == "registrationToForgottenPassword" {
            
            return true
        
        // navigation will not occur
        } else {
         
            return false
            
        }
    }
}
