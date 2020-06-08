//
//  NewArrivalCell.swift
//  Shoppie
//
//  Created by Min Thet Maung on 04/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//


import UIKit

protocol OddSectionCellDelegate {
    func didTapProductCell()
}

class OddSectionCell: BaseCell {
    
    var delegate: OddSectionCellDelegate?
    
    var itemsArray: [Item]?
    
    lazy var bgViewTopAnchor: NSLayoutConstraint = self.bgView.topAnchor.constraint(equalTo: self.topAnchor, constant: -50)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 30
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.showsHorizontalScrollIndicator = false
        cv.contentInset = UIEdgeInsets(top: 10, left: 17, bottom: 30, right: 0)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let bgView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 60
        v.layer.maskedCorners = [.layerMinXMinYCorner]
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    let captionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.numberOfLines = 1
        lbl.backgroundColor = .clear
        lbl.text = "New Arrivals".uppercased()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    

    static var reuseIdentifier = String(describing: OddSectionCell.self)
  
    override func setupViews() {
        super.setupViews()
        addSubview(bgView)
        addSubview(captionLabel)
        addSubview(collectionView)
    
        layer.zPosition = 2
        setupCollectionView()
        setupBgViewConstraints()
        setupCaptionLabelConstraints()
        setupCollectionViewConstraints()

        
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(NewArrivalItemCell.self, forCellWithReuseIdentifier: NewArrivalItemCell.reuseIdentifier)
    }
    
    private func setupBgViewConstraints() {
        NSLayoutConstraint.activate([
            bgView.leftAnchor.constraint(equalTo: leftAnchor, constant: 0),
            bgView.rightAnchor.constraint(equalTo: rightAnchor),
            bgViewTopAnchor,
            bgView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupCaptionLabelConstraints() {
        NSLayoutConstraint.activate([
            captionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
            captionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
            captionLabel.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 39),
            captionLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setupCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.widthAnchor.constraint(equalTo: widthAnchor),
            collectionView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 70),
            collectionView.bottomAnchor.constraint(equalTo: bgView.bottomAnchor),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
    
}

extension OddSectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemsArray?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewArrivalItemCell.reuseIdentifier, for: indexPath) as! NewArrivalItemCell
        cell.itemName = itemsArray?[indexPath.item].itemName
        cell.itemPrice = itemsArray?[indexPath.item].itemPrice
        cell.imageName = itemsArray?[indexPath.item].imageName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 195, height: 262)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTapProductCell()
    }

}


