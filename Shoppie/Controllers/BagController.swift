//
//  BagController.swift
//  Shoppie
//
//  Created by Min Thet Maung on 02/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class BagController: UIViewController {
    
    private let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    private let footerView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.shadowRadius = 8
        v.layer.shadowOpacity = 0.12
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.shadowOffset = CGSize(width: 0, height: 2)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let totalAmountCaption: UILabel = {
        let lbl = UILabel()
        lbl.text = "Toal Amount"
        lbl.textColor = #colorLiteral(red: 0.7411764706, green: 0.7411764706, blue: 0.7411764706, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    private let totalPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "$300"
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return lbl
    }()
    
    private let checkoutButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.setAttributedTitle(NSAttributedString(string: "Checkout", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold), NSAttributedString.Key.foregroundColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)]), for: .normal)
        btn.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupViews()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 144
        tableView.register(BagCell.self, forCellReuseIdentifier: BagCell.reuseIdentifier)
    }
    
    private func setupViews() {
        title = "My Bag"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
        view.addSubview(footerView)
        footerView.addSubview(totalAmountCaption)
        footerView.addSubview(totalPriceLabel)
        footerView.addSubview(checkoutButton)
        
        setTableViewConstraints()
        setFooterViewConstraints()
        setTotalAmountCaptionConstaints()
        setToalPriceLabelConstraints()
        setCheckoutButtonConstraints()
    }
    
    private func setTableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        tableView.bottomAnchor.constraint(equalTo: footerView.topAnchor, constant: 0),
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setFooterViewConstraints() {
        NSLayoutConstraint.activate([
            footerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            footerView.topAnchor.constraint(equalTo: totalAmountCaption.topAnchor, constant: -20),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setTotalAmountCaptionConstaints() {
        NSLayoutConstraint.activate([
            totalAmountCaption.heightAnchor.constraint(equalToConstant: 40),
            totalAmountCaption.bottomAnchor.constraint(equalTo: checkoutButton.topAnchor, constant: -20),
            totalAmountCaption.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            totalAmountCaption.widthAnchor.constraint(lessThanOrEqualToConstant: 200)
        ])
    }
    
    private func setToalPriceLabelConstraints() {
        NSLayoutConstraint.activate([
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 40),
            totalPriceLabel.centerYAnchor.constraint(equalTo: totalAmountCaption.centerYAnchor),
            totalPriceLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            totalPriceLabel.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16)
        ])
    }
    
    private func setCheckoutButtonConstraints(){
        NSLayoutConstraint.activate([
            checkoutButton.heightAnchor.constraint(equalToConstant: 50),
            checkoutButton.leadingAnchor.constraint(equalTo: footerView.leadingAnchor, constant: 16),
            checkoutButton.trailingAnchor.constraint(equalTo: footerView.trailingAnchor, constant: -16),
            checkoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}


extension BagController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BagCell.reuseIdentifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
        }
    }
    
}
