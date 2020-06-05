//
//  ThirdSectionCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 05/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class EventSectionCell: BaseCell {
    
    static var reuseIdentifier = String(describing: EventSectionCell.self)
    
    var promotedItem: PromotedItem? {
        didSet {
            titleLabel.text = promotedItem?.title
            captionLabel.text = promotedItem?.caption
            if let imageName = promotedItem?.imageName {
                itemImage.image = UIImage(named: imageName)
            }
        }
    }
    
    private let bgWhiteView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 1)
        lbl.text = "NOW IN"
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    private let captionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        lbl.numberOfLines = 0
        lbl.textAlignment = .center
        lbl.text = "Explore this week menwear"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return lbl
    }()
    
    private let shopNowLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SHOP NOW"
        lbl.textColor = #colorLiteral(red: 0.2823529412, green: 0.2823529412, blue: 0.2823529412, alpha: 1)
        lbl.numberOfLines = 1
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return lbl
    }()
    
    private let itemImage: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "4")
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override func setupViews() {
        super.setupViews()
        backgroundColor = .white
        
        layer.zPosition = 3
        
        addSubview(itemImage)
        addSubview(bgWhiteView)
        
        bgWhiteView.addSubview(titleLabel)
        bgWhiteView.addSubview(captionLabel)
        bgWhiteView.addSubview(shopNowLabel)
        
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: topAnchor),
            itemImage.leftAnchor.constraint(equalTo: leftAnchor),
            itemImage.rightAnchor.constraint(equalTo: rightAnchor),
            itemImage.heightAnchor.constraint(equalToConstant: 275),
            
            bgWhiteView.topAnchor.constraint(equalTo: topAnchor, constant: 209),
            bgWhiteView.leftAnchor.constraint(equalTo: leftAnchor, constant: 32.5),
            bgWhiteView.rightAnchor.constraint(equalTo: rightAnchor, constant: -32.5),
            bgWhiteView.heightAnchor.constraint(equalToConstant: 103),
            
            titleLabel.topAnchor.constraint(equalTo: bgWhiteView.topAnchor, constant: 15),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            captionLabel.topAnchor.constraint(equalTo: bgWhiteView.topAnchor, constant: 38),
            captionLabel.leadingAnchor.constraint(equalTo: bgWhiteView.leadingAnchor, constant: 16),
            captionLabel.trailingAnchor.constraint(equalTo: bgWhiteView.trailingAnchor, constant: -16),
            captionLabel.heightAnchor.constraint(equalToConstant: 30),
            
            shopNowLabel.bottomAnchor.constraint(equalTo: bgWhiteView.bottomAnchor, constant: -16),
            shopNowLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            shopNowLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            shopNowLabel.bottomAnchor.constraint(equalTo: bgWhiteView.bottomAnchor, constant: -16),
        ])
    }
}
