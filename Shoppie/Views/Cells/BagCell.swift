//
//  BagCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 08/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class BagCell: UITableViewCell {
    
    static let reuseIdentifier = String(describing: BagCell.self)
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "9")
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 10
        iv.contentMode = .top
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let productNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 1
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.text = "Tiger Print Shirt".uppercased()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return lbl
    }()
    
    private let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.text = "$39.90"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return lbl
    }()
    
    private let sizeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.text = "Size: M"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return lbl
    }()
    
    private let colorLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        lbl.text = "Size: Green"
        lbl.numberOfLines = 1
        lbl.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        return lbl
    }()
    
    private let minusButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9607843137, blue: 0.9921568627, alpha: 1)
        btn.setAttributedTitle(NSAttributedString(string: "-", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)]), for: .normal)
        btn.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        return btn
    }()
    
    private let numberLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "1"
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.textAlignment = .center
        lbl.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9607843137, blue: 0.9921568627, alpha: 1)
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return lbl
    }()
    
    private let plusButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("-", for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9607843137, blue: 0.9921568627, alpha: 1)
        btn.setAttributedTitle(NSAttributedString(string: "+", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold), NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)]), for: .normal)
        btn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return btn
    }()
    
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        return sv
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    private func setupViews(){
        
        [minusButton, numberLabel, plusButton].forEach {
            stackView.addArrangedSubview($0)
        }
        
        addSubview(productImageView)
        addSubview(productNameLabel)
        addSubview(sizeLabel)
        addSubview(priceLabel)
        addSubview(colorLabel)
        addSubview(stackView)
        
        constraintsWithVisualFormat(format: "H:|-16-[v0(130)]-13-[v1]-5-[v2(60)]-16-|", views: productImageView, productNameLabel, stackView)
        constraintsWithVisualFormat(format: "H:|-16-[v0(130)]-13-[v1]-16-|", views: productImageView, priceLabel)
        constraintsWithVisualFormat(format: "H:|-16-[v0(130)]-13-[v1]-16-|", views: productImageView, sizeLabel)
        constraintsWithVisualFormat(format: "H:|-16-[v0(130)]-13-[v1]-16-|", views: productImageView, colorLabel)
        
        constraintsWithVisualFormat(format: "V:|-24-[v0]-24-|", views: productImageView)
        constraintsWithVisualFormat(format: "V:|-24-[v0(20)]-6-[v1(14)]-14-[v2(12)]-4-[v3(12)]", views: productNameLabel, priceLabel, sizeLabel, colorLabel)
        constraintsWithVisualFormat(format: "V:|-24-[v0(20)]", views: stackView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
