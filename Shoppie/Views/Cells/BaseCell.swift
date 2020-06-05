//
//  BaseCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 04/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class BaseCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
}
