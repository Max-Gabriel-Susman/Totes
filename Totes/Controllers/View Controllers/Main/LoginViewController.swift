//
//  LoginViewController.swift
//  Totes
//
//  Created by Moses on 6/30/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    // MARK: - Outlets
    //@IBOutlet weak var usernameEntryPromptLabel: UITextField!
    @IBOutlet weak var usernameEntryPromptLabel: UILabel!
    @IBOutlet weak var passwordEntryPromptLabel: UILabel!
    
    @IBOutlet weak var enterUsernameTextField: UITextField!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    //@IBOutlet weak var enterUsernameTextField: UITextField!
    
    // MARK: - Properties
    let mockDataru = ["Prometheus" : ["password" : "Moses1998!", "email" : "gabe.susman@gmail.com"], "NobodyHome" : ["password" : "Susman1998!", "email" : "gaebster7@gmail.com"]]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        
        var isUser = false
        var isAuthenticated = false
        var actualPassword = ""
        
        let usernameEntry = enterUsernameTextField.text ?? ""
        let passwordEntry = enterPasswordTextField.text ?? ""
        
        let user = User(username: usernameEntry, password: passwordEntry)
        
        for key in mockDataru.keys {
            if key == usernameEntry {
                isUser = true
                actualPassword = mockDataru[usernameEntry]?["password"] ?? ""
                
            }
        }
        
        print(actualPassword)
        print(passwordEntry)
        
        if isUser == true {
            
            if actualPassword == passwordEntry {
                
                isAuthenticated = true
                clearLabels()
                //clearTextFields()
                print("Logged in!")
                
            } else {
                
                clearLabels()
                clearTextFields()
                passwordEntryPromptLabel.text = "The password is incorrect"
                
            }
            
        } else {
            
            clearLabels()
            clearTextFields()
            usernameEntryPromptLabel.text = "That's an invalid username"
            
        }
        
        
    }
    @IBAction func registrationButton(_ sender: Any) {
    }
    @IBAction func forgottenPasswordButton(_ sender: Any) {
    }
    
    // MARK: - Methods
    func clearTextFields() {
        
        enterUsernameTextField.text = ""
        enterPasswordTextField.text = ""
        
    }
    
    func clearLabels() {
        
        usernameEntryPromptLabel.text = ""
        passwordEntryPromptLabel.text = ""
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
} // END OF CLASS
