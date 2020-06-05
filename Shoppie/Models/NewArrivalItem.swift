//
//  NewArrivalItem.swift
//  Shoppie
//
//  Created by Min Thet Maung on 05/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import Foundation

struct Item: Codable {
    var itemName: String
    var imageName: String
    var itemPrice: String
    
    init(itemName: String, imageName: String, itemPrice: String) {
        self.itemName = itemName
        self.itemPrice = itemPrice
        self.imageName = imageName
    }
}
