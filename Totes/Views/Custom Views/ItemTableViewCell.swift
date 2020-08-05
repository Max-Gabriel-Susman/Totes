//
//  ItemTableViewCell.swift
//  Totes
//
//  Created by Moses on 8/5/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    
    // MARK: - Actions
    @IBOutlet weak var changeQuantityButtonTapped: UIButton!

} // END OF CLASS
