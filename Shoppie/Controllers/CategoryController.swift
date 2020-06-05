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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        let searchController = UISearchController()
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
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
