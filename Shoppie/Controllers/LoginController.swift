//
//  LoginController.swift
//  Shoppie
//
//  Created by Min Thet Maung on 14/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    private let bgImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "gregory-hayes-AjJsc0hk9s0-unsplash")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "SHOPPIE"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 48, weight: .semibold)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let subTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Men Fashion App"
        lbl.textColor = .white
        lbl.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let loginButton: UIButton = {
        let btn = UIButton()
        btn.layer.cornerRadius = 25
        btn.backgroundColor = .white
        btn.setAttributedTitle(NSAttributedString(string: "Login With Phone", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)]), for: .normal)
        btn.addTarget(self, action: #selector(loggedInButtonPressed), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    @objc private func loggedInButtonPressed() {
        AuthService.instance.isLoggedIn = true
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(bgImageView)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(loginButton)
        
        view.constraintsWithVisualFormat(format: "H:|[v0]|", views: bgImageView)
        view.constraintsWithVisualFormat(format: "V:|[v0]|", views: bgImageView)
        
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            subTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
