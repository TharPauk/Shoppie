//
//  NewArrivalItemCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 04/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class NewArrivalItemCell: BaseCell {
    
    static var reuseIdentifier = String(describing: NewArrivalItemCell.self)
    
    var imageName: String? {
        didSet {
            itemImageView.image = UIImage(named: imageName!)
        }
    }
    
    var itemName: String? {
        didSet {
            itemNameLabel.text = itemName?.uppercased()
        }
    }
    
    var itemPrice: String? {
        didSet {
            itemPriceLabel.text = "\(itemPrice!) USD"
        }
    }
    
    let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        iv.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        iv.image = #imageLiteral(resourceName: "2")
        return iv
    }()
    
    let itemNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.text = "BASIC SOLID COLOR SHIRT"
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return lbl
    }()
    
    let itemPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 1)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.text = "35.90 USD"
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return lbl
    }()

    override func setupViews() {
        backgroundColor = .white
        
        setupShadowLayer()
        
        addSubview(itemImageView)
        addSubview(itemNameLabel)
        addSubview(itemPriceLabel)
        
        constraintsWithVisualFormat(format: "H:|[v0]|", views: itemImageView)
        constraintsWithVisualFormat(format: "H:|-7-[v0]-7-|", views: itemNameLabel)
        constraintsWithVisualFormat(format: "H:|-7-[v0]-7-|", views: itemPriceLabel)
        
        
        constraintsWithVisualFormat(format: "V:|[v0(190)]-16-[v1(16)]-8-[v2(16)]-16-|", views: itemImageView, itemNameLabel, itemPriceLabel)
    }

    private func setupShadowLayer() {
        layer.cornerRadius = 10
        layer.shadowColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        layer.shadowOpacity = 0.7
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 4
    }
}
