//
//  PromotedItem.swift
//  Shoppie
//
//  Created by Min Thet Maung on 05/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import Foundation

struct PromotedItem: Codable {
    var title: String
    var caption: String
    var imageName: String
    
    init(title: String, caption: String, imageName: String) {
        self.title = title
        self.caption = caption
        self.imageName = imageName
        
    }
}
