//
//  HeroImageCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 04/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class FirstSectionCell: BaseCell {
    
    static var reuseIdentifier = String(describing: FirstSectionCell.self)
    
    let heroImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "1")
        iv.backgroundColor = .lightGray
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let percentageLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.text = "30% OFF"
        lbl.textAlignment = .left
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return lbl
    }()
    
    let captionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        let attributedText = NSMutableAttributedString(string: "SPRING\n", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 48, weight: .bold)])
        attributedText.append(NSAttributedString(string: "Collection", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)]))
        lbl.attributedText = attributedText
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()

    override func setupViews() {
        
        super.setupViews()
        layer.zPosition = 1
        
        addSubview(heroImageView)
        addSubview(percentageLabel)
        addSubview(captionLabel)
        
        heroImageView.pin(to: self)
        
        NSLayoutConstraint.activate([
            percentageLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            percentageLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            percentageLabel.topAnchor.constraint(equalTo: topAnchor, constant: 92),
            percentageLabel.heightAnchor.constraint(equalToConstant: 40),
            
            captionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            captionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            captionLabel.topAnchor.constraint(equalTo: percentageLabel.topAnchor, constant: 23),
            captionLabel.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
