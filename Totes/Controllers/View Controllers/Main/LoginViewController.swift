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
    @IBOutlet weak var usernameEntryPromptLabel: UILabel!
    @IBOutlet weak var passwordEntryPromptLabel: UILabel!
    
    @IBOutlet weak var enterUsernameTextField: UITextField!
    @IBOutlet weak var enterPasswordTextField: UITextField!
    
    // MARK: - Properties
    // we need isAuthenticated to revert to false post segue
    var isAuthenticated = false
    var docRef: DocumentReference!
    var usersListener: ListenerRegistration!
    var user: String?
    let mockDataru = ["Prometheus" : ["password" : "Moses1998!", "email" : "gabe.susman@gmail.com"], "NobodyHome" : ["password" : "Susman1998!", "email" : "gaebster7@gmail.com"]]
    var users: [String : Any] = [:]

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        docRef = Firestore.firestore().document("users/userbase")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        usersListener = docRef.addSnapshotListener { (docSnapshot, error) in
            guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
            let userbase = docSnapshot.data()
            // we need to pull the username here
            //let users = userbase?["users"] as? [String : Any] ?? [:]
            // perhaps I'm going to want to explore .map
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        usersListener.remove()
    }

    
    // MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        
        // Variable used in authentication process
        var isUser = false
        var actualPassword = ""
        
        // Captures user entry
        let usernameEntry = enterUsernameTextField.text ?? ""
        let passwordEntry = enterPasswordTextField.text ?? ""
        
        // Validates username entry
        for key in mockDataru.keys {
            
            if key == usernameEntry {
                isUser = true
                actualPassword = mockDataru[usernameEntry]?["password"] ?? ""
                
            }
        }
        
        // Validates password entry
        if isUser == true {
            
           
            // Succesful authentication branch & manages UIelement content
            if actualPassword == passwordEntry {
                
                isAuthenticated = true
                clearLabels()
                user = usernameEntry
                print("this is user post authentication loginVC : \(user ?? "")")
            
            // Failed password validation branch & manages UIelement content
            } else {
                
                clearLabels()
                clearTextFields()
                passwordEntryPromptLabel.text = "The password is incorrect"
                
            }
        // Failed username validation branch & manages UIelement content
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
    
    // MARK: - Helper Methods
    func clearTextFields() {
        
        enterUsernameTextField.text = ""
        enterPasswordTextField.text = ""
        
    }
    
    func clearLabels() {
        
        usernameEntryPromptLabel.text = ""
        passwordEntryPromptLabel.text = ""
        
    }
    
    // MARK: - Navigation
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        // allows navigation to the TabBarController in the event of successful authentication
        if identifier == "loginToTabBar" && isAuthenticated == true {
            
            return true
        
        // allows unconditional navigation to the Registration Controller
        } else if identifier == "loginToRegistration" {
            
            return true
        
        // allows unconditional navigation to the forgottenPassword controller
        } else if identifier == "loginToForgottenPassword" {
            
            return true
        
        // navigation won't be performed
        } else {
            
            return false
            
        }
    }
} // END OF CLASS
