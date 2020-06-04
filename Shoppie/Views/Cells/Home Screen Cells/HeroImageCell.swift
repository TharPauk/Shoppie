//
//  HeroImageCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 04/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class HeroImageCell: BaseCell {
    
    let heroImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "1")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    let percentageLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "30%"
        return lbl
    }()

    override func setupViews() {
        super.setupViews()
        
        addSubview(heroImageView)
        addSubview(percentageLabel)
    }
    
}
