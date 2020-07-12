//
//  InventoryTableViewController.swift
//  Totes
//
//  Created by Moses on 6/2/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit
import Firebase
/*
 
 Let's replace this entire setup with a tableview inside of a ViewController so that we can use multiple views in the same view controller
 
 */
class InventoryTableViewController: UITableViewController {
    
    // MARK: - Outlets
    
    
    // MARK: - Properties
    // we need to create the code to retrieve the actual document titles from cloud firestore
    var collectRef: CollectionReference!
    var quoteListener: ListenerRegistration!
    
    // mock data array
    //let inventory: [String] = ["company culture", "goggle rentals", "sunglasses", "towels"]
    var inventory: [String] = []

    // MARK: - LifecycleMethods
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Get a reference to the pedestal collection
        final CollectionReference pedestals = mFirestore.collection("pedestals");

        // get all the names of the pedestals in firestore
        pedestals.get().addOnCompleteListener(new OnCompleteListener<QuerySnapshot>() {
            @Override
            public void onComplete(@NonNull Task<QuerySnapshot> task) {
                if (task.isSuccessful()) {
                    for (QueryDocumentSnapshot document : task.getResult()) {
                        Log.d(TAG, document.getId() + " => " + document.getString("name"));
                        Map<String, Object> map = document.getData();
                    }
                }
            }
        });
        
        // we need to read aboot addSnapshotListener
        quoteListener = collectRef.addSnapshotListener { (collectSnapshot, error) in
        guard let collectSnapshot = collectSnapshot/*, collectSnapshot.exists */ else { return }
        let myData = collectSnapshot.data()
        // grabbing content from your data like this will always return an optional value
//        let latestQuote = myData?["quote"] as? String ?? ""
//        let quoteAuthor = myData?["author"] as? String ?? "(none)"
        // self.quoteLabel.text = "\"\(latestQuote)\" -- \(quoteAuthor)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectRef = Firestore.firestore().collection("inventory")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        quoteListener.remove()
    }
    
    // MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
//        guard let quoteText = quoteTextField.text, !quoteText.isEmpty else { return }
//        guard let quoteAuthor = authorsNameTextField.text, !quoteAuthor.isEmpty else { return }
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
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return inventory.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showSection", for: indexPath)
        
        let sectionName = inventory[indexPath.row]
        
        cell.textLabel?.text = sectionName

        return cell
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
    }
} // END OF CLASS
