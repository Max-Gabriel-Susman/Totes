//
//  Section.swift
//  Totes
//
//  Created by Moses on 6/2/20.
//  Copyright © 2020 Max Susman. All rights reserved.
//

import Foundation


class Section {
    
    let sectionName: String
    let itemCount: Int
    var items: [Item]
    
    init(sectionName: String, itemCount: Int, items: [Item] = []) {
        self.sectionName = sectionName
        self.itemCount = itemCount
        self.items = items
    }
} // END OF CLASS
