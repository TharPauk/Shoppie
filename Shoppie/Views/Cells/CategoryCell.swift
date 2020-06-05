//
//  CategoryCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 02/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class CategoryCell: BaseCell {
    
    static var reuseIdentifier = String(describing: CategoryCell.self)
    
    let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = ""
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        lbl.textColor = .white
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        iv.image = UIImage(named: "gray")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    var category: Category? {
        didSet {
            if let imageName = category?.image {
                imageView.image = UIImage(named: imageName)
            }
            
            if let name = category?.name {
                nameLabel.text = name.uppercased()
            }
        }
    }
    
    override func setupViews() {
        addSubview(imageView)
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: widthAnchor),
            imageView.heightAnchor.constraint(equalTo: heightAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
