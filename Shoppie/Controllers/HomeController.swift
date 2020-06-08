//
//  HomeController.swift
//  Shoppie
//
//  Created by Min Thet Maung on 02/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController {
    
    var newArrivalItems = [
        Item(itemName: "Solid Color Shirt", imageName: "2", itemPrice: "35.90"),
        Item(itemName: "Textured Plain Shirt", imageName: "3", itemPrice: "43.90")
    ]
    
    var justForYouItems = [
        Item(itemName: "Pastel Leather", imageName: "5", itemPrice: "22.90"),
        Item(itemName: "Leather Shoe", imageName: "6", itemPrice: "25.90")
    ]
    
    var nowInShops = PromotedItem(title: "Now in", caption: "Explore this week menwear", imageName: "4")
    var promotion = PromotedItem(title: "Up to 50% off".uppercased(), caption: "Keep on top of your style with everyday essentials to weekend looks", imageName: "7")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.modalPresentationStyle = .fullScreen
        setupCollectionViewLayout()
        setupCollectionView()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
        setupCollectionViewTopInset()
        view.layoutIfNeeded()
    }
    
    fileprivate func setupCollectionViewTopInset() {
        // remove contentInset not to cover with status bar in iPhone with nortch
        var top: CGFloat
        if #available(iOS 11.0, *) {
            top = UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        } else {
            top = UIApplication.shared.statusBarFrame.height
        }
        collectionView.contentInset.top = -top
    }
    
    private func setupCollectionView() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
        
        setupCollectionViewTopInset()

        collectionView.register(FirstSectionCell.self, forCellWithReuseIdentifier: FirstSectionCell.reuseIdentifier)
        collectionView.register(OddSectionCell.self, forCellWithReuseIdentifier: OddSectionCell.reuseIdentifier)
        collectionView.register(EventSectionCell.self, forCellWithReuseIdentifier: EventSectionCell.reuseIdentifier)
    }
    
    private func setupCollectionViewLayout() {
        if let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumInteritemSpacing = 30
        }
        
    }
    
    fileprivate func setupViews() {
        view.addSubview(collectionView)
        
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: .init(), metrics: nil, views: ["v0" : collectionView!]))
        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: .init(), metrics: nil, views: ["v0" : collectionView!]))
    }
    
}

extension HomeController: UICollectionViewDelegateFlowLayout{
    

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    private func getRelatedCell(indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            return collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCell.reuseIdentifier, for: indexPath) as? FirstSectionCell ?? UICollectionViewCell()
        case 1,3:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OddSectionCell.reuseIdentifier, for: indexPath) as? OddSectionCell else { return UICollectionViewCell() }
            cell.itemsArray = newArrivalItems
            if indexPath.section == 3 {
                cell.bgViewTopAnchor.constant = 0
                cell.bgView.layer.cornerRadius = 0
                cell.itemsArray = justForYouItems
                cell.captionLabel.text = "Just For You".uppercased()
            }
            cell.delegate = self
            return cell
        case 2,4:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventSectionCell.reuseIdentifier, for: indexPath) as? EventSectionCell else { return UICollectionViewCell() }
            cell.promotedItem = promotion
            if indexPath.section == 2 {
                cell.promotedItem = nowInShops
            }
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    private func getRelatedCellSize(indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: view.frame.width, height: 573)
        case 1:
            return CGSize(width: view.frame.width, height: 347)
        case 3:
            return CGSize(width: view.frame.width, height: 397)
        case 2,4:
            return CGSize(width: view.frame.width, height: 312)
        default:
            return CGSize(width: view.frame.width, height: 347)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        getRelatedCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        getRelatedCellSize(indexPath: indexPath)
    }
    
    
}

extension HomeController: OddSectionCellDelegate {
    func didTapProductCell() {
        navigationController?.pushViewController(ProductDetailController(), animated: true)
    }
    
    
}
