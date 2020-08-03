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
    @IBOutlet weak var enterPasswordTextField: UITextField!
    @IBOutlet weak var enterUsernameTextField: UITextField!
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        
    }
    @IBAction func registrationButton(_ sender: Any) {
    }
    @IBAction func forgottenPasswordButton(_ sender: Any) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
} // END OF CLASS
