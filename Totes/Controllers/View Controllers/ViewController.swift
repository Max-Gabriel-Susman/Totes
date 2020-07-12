//
//  ViewController.swift
//  Totes
//
//  Created by Moses on 7/9/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase
// This is all you need to import regardless of what specific firebase libraries you are using
import Firebase

class ViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var quoteTextField: UITextField!
    @IBOutlet weak var authorsNameTextField: UITextField!
    
    // MARK: - Properties
    var docRef: DocumentReference!
    var quoteListener: ListenerRegistration!
    
    // MARK: - LifecycleMethods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        quoteListener = docRef.addSnapshotListener { (docSnapshot, error) in
        guard let docSnapshot = docSnapshot, docSnapshot.exists else { return }
        let myData = docSnapshot.data()
        // grabbing content from your data like this will always return an optional value
        let latestQuote = myData?["quote"] as? String ?? ""
        let quoteAuthor = myData?["author"] as? String ?? "(none)"
        self.quoteLabel.text = "\"\(latestQuote)\" -- \(quoteAuthor)"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        docRef = Firestore.firestore().document("sampleData/inspiration")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        quoteListener.remove()
    }
  
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let quoteText = quoteTextField.text, !quoteText.isEmpty else { return }
        guard let quoteAuthor = authorsNameTextField.text, !quoteAuthor.isEmpty else { return }
        let dataToSave: [String: Any] = ["quote" : quoteText, "author" : quoteAuthor]
        docRef.setData(dataToSave) { (error) in
            if let error = error {
                print("Oh no! Got an error : \(error.localizedDescription)")
            } else {
                print("Data has been saved!")
            }

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //docRef =
    }

}
