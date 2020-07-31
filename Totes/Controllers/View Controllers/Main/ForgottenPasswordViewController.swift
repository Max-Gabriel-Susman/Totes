//
//  ForgottenPasswordViewController.swift
//  Totes
//
//  Created by Moses on 6/30/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase

class ForgottenPasswordViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var enterEmailTextField: UITextField!
    
    // MARK: - Properties

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Actions
    @IBAction func resetLinkButton(_ sender: Any) {
    }
    @IBAction func registrationButton(_ sender: Any) {
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
