//
//  CategoryController.swift
//  Shoppie
//
//  Created by Min Thet Maung on 02/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class CategoryController: UIViewController {
    
    private let searchBarCellId = "searchBarCellId"
    
    private var categories: [Category] = [
        Category(name: "Watch", image: "watches"),
        Category(name: "Shoes", image: "shoes"),
        Category(name: "Clothing", image: "clothing"),
        Category(name: "Bags", image: "bags"),
        Category(name: "Accessories", image: "accessories"),
    ]

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    
    
    private func setupNavBar() {
        navigationItem.title = "Category"
        
        if let navBar = navigationController?.navigationBar {
            navBar.prefersLargeTitles = true
            navBar.isTranslucent = true
            navBar.barTintColor = .white
            
            navBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            navBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "add_to_bag"), style: .plain, target: self, action: #selector(hanldeBagButtonPressed))
        
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    @objc private func hanldeBagButtonPressed() {
        let bagController = BagController()
        present(bagController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBar()
        setupCollectionView()
        setupViews()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseIdentifier)
    }
    
    private func setupViews() {
        tabBarController?.tabBar.isHidden = false
        
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
        collectionView.backgroundColor = .clear
        
        collectionView.pin(to: view)
    }

}

extension CategoryController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseIdentifier, for: indexPath) as? CategoryCell else { return UICollectionViewCell() }
        cell.category = categories[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 156)
    }
    

}
