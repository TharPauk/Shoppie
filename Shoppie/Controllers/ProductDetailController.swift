//
//  ProductDetailController.swift
//  Shoppie
//
//  Created by Min Thet Maung on 08/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

class ProductDetailController: UIViewController {
    
    private let sizes = ["XS", "S", "M", "L"]
    
    private let backButton: UIButton = {
        let btn = UIButton()
        let img = #imageLiteral(resourceName: "left-arrow").withRenderingMode(.alwaysTemplate)

        btn.imageView?.tintColor = .systemBlue
        btn.backgroundColor = .clear
        btn.setImage(img, for: .normal)
        btn.frame = CGRect(x: 5, y: 50, width: 30, height: 30)
        btn.addTarget(self, action: #selector(backToList), for: .touchUpInside)
        return btn
    }()
    
    
    private let productImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "8")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let productTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.textAlignment = .left
        lbl.text = "Leaf Print Shirt"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return lbl
    }()
    
    private let productPrice: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.3098039216, green: 0.3098039216, blue: 0.3098039216, alpha: 1)
        lbl.text = "$39.90 USD"
        lbl.textAlignment = .right
        lbl.backgroundColor = .clear
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return lbl
    }()
    
    private let colorLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Color"
        lbl.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return lbl
    }()
    
    private let sizeLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Size"
        lbl.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return lbl
    }()
    
    private let colorCircle: UIView = {
        let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.05882352941, green: 0.3725490196, blue: 0.4, alpha: 1)
        v.layer.cornerRadius = 21 / 2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let sizeOptionStackView: UIStackView = {
        let sv = UIStackView(frame: .zero)
        sv.spacing = 5
        sv.axis = .horizontal
        sv.backgroundColor = .clear
        sv.distribution = .equalSpacing
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    private let productDescription: UILabel = {
        let lbl = UILabel()
        lbl.textColor = #colorLiteral(red: 0.5098039216, green: 0.5098039216, blue: 0.5098039216, alpha: 1)
        lbl.numberOfLines = 0
        lbl.backgroundColor = .clear
        lbl.text = "Relaxed fit shirt with spread collar and short sleeves. Side vents at hem. Front button closure. Relaxed fit shirt with spread collar and short sleeves. Side vents at hem. Front button closure."
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return lbl
    }()
    
    
    private let addToBagButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = #colorLiteral(red: 0.1019607843, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
        btn.layer.cornerRadius = 20
        let img = UIImage(named: "add_to_bag")?.withRenderingMode(.alwaysTemplate)
        btn.setImage(img, for: .normal)
        btn.imageView?.tintColor = .white
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.textAlignment = .center
        
        let attributedString = NSAttributedString(string: "  Add To Bag", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14, weight: .bold), NSAttributedString.Key.foregroundColor: UIColor.white])
        btn.setAttributedTitle(attributedString, for: .normal)
        
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let productInfoView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 30
        v.backgroundColor = .white
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return v
    }()
    
    override func viewDidLoad() {
        setupViews()
    }
    
    @objc private func backToList() {
        navigationController?.popViewController(animated: true)
    }
    
    private func createSizeButton(size: String) -> UIButton {
        let btn = UIButton()
        btn.setTitle(size, for: .normal)
        btn.setTitleColor(#colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), for: .normal)
        let attributedString = NSAttributedString(string: size, attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)])
        btn.setAttributedTitle(attributedString, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }
    
    private func setupViews() {
        
        

        tabBarController?.tabBar.isHidden = true
        navigationController?.navigationBar.isHidden = true
        
        sizes.forEach {
            let btn = self.createSizeButton(size: $0)
            btn.widthAnchor.constraint(equalToConstant: 20).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 20).isActive = true
            btn.layer.cornerRadius = 10
            self.sizeOptionStackView.addArrangedSubview(btn)
        }
        if let btn = sizeOptionStackView.subviews[2] as? UIButton {
            btn.setAttributedTitle(NSAttributedString(string: sizes[2] ?? "M", attributes: [NSAttributedString.Key.foregroundColor : #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1), NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .semibold)]), for: .normal)
            btn.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.9607843137, blue: 0.9921568627, alpha: 1)
        }
        view.addSubview(productImageView)
        view.addSubview(productInfoView)
        view.addSubview(backButton)
        
        
        productInfoView.addSubview(productTitle)
        productInfoView.addSubview(productPrice)
        productInfoView.addSubview(colorLabel)
        
        productInfoView.addSubview(sizeLabel)
        productInfoView.addSubview(sizeOptionStackView)
        productInfoView.addSubview(colorCircle)
        productInfoView.addSubview(productDescription)
        productInfoView.addSubview(addToBagButton)
 
        
        setProductImageViewConstraints()
        setProductInfoViewConstraints()
        setProductTitleConstraints()
        setProductPriceConstraints()
        setColorLabelConstraints()
        
        setColorCircleContraints()
        setSizeLabelConstraints()
        setSizeOptionStackViewConstraints()
        setProductDescriptionConstraints()
        setAddToBagButtonConstraints()
    }
    
    private func setProductImageViewConstraints() {
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productInfoView.bottomAnchor.constraint(greaterThanOrEqualToSystemSpacingBelow: productInfoView.topAnchor, multiplier: 30)
        ])
    }
    
    private func setProductInfoViewConstraints() {
        NSLayoutConstraint.activate([
            productInfoView.widthAnchor.constraint(equalTo: view.widthAnchor),
            productInfoView.heightAnchor.constraint(equalToConstant: 326),
            productInfoView.leftAnchor.constraint(equalTo: view.leftAnchor),
            productInfoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setProductTitleConstraints() {
        NSLayoutConstraint.activate([
            productTitle.leftAnchor.constraint(equalTo: productInfoView.leftAnchor, constant: 17),
            productTitle.topAnchor.constraint(equalTo: productInfoView.topAnchor, constant: 23),
            productTitle.rightAnchor.constraint(equalTo: productPrice.leftAnchor, constant: -5),
            productTitle.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setProductPriceConstraints() {
        NSLayoutConstraint.activate([
            productPrice.widthAnchor.constraint(equalToConstant: 100),
            productPrice.centerYAnchor.constraint(equalTo: productTitle.centerYAnchor),
            productPrice.rightAnchor.constraint(equalTo: productInfoView.rightAnchor, constant: -16),
            productPrice.heightAnchor.constraint(equalTo: productTitle.heightAnchor)
        ])
    }
    
    private func setColorLabelConstraints() {
        NSLayoutConstraint.activate([
            colorLabel.leftAnchor.constraint(equalTo: productInfoView.leftAnchor, constant: 17),
            colorLabel.widthAnchor.constraint(equalToConstant: 60),
            colorLabel.heightAnchor.constraint(equalToConstant: 14),
            colorLabel.topAnchor.constraint(equalTo: productInfoView.topAnchor, constant: 64)
        ])
    }
   
    private func setColorCircleContraints() {
        NSLayoutConstraint.activate([
            colorCircle.leftAnchor.constraint(equalTo: colorLabel.leftAnchor),
            colorCircle.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 3),
            colorCircle.widthAnchor.constraint(equalToConstant: 21),
            colorCircle.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
    
    private func setSizeLabelConstraints() {
        NSLayoutConstraint.activate([
            sizeLabel.topAnchor.constraint(equalTo: productInfoView.topAnchor, constant: 64),
            sizeLabel.leftAnchor.constraint(equalTo: sizeOptionStackView.leftAnchor, constant: 0),
            sizeLabel.centerYAnchor.constraint(equalTo: colorLabel.centerYAnchor),
            sizeLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
    }
    
    private func setSizeOptionStackViewConstraints() {
        NSLayoutConstraint.activate([
            sizeOptionStackView.rightAnchor.constraint(equalTo: productInfoView.rightAnchor, constant: -16),
            sizeOptionStackView.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 6),
            sizeOptionStackView.widthAnchor.constraint(lessThanOrEqualToConstant: 200),
            sizeOptionStackView.heightAnchor.constraint(lessThanOrEqualToConstant: 100)
        ])
    }
    private func setProductDescriptionConstraints() {
        NSLayoutConstraint.activate([
            productDescription.leftAnchor.constraint(equalTo: productInfoView.leftAnchor, constant: 16),
            productDescription.rightAnchor.constraint(equalTo: productInfoView.rightAnchor, constant: -16),
            productDescription.topAnchor.constraint(equalTo: productInfoView.topAnchor, constant: 118),
            productDescription.bottomAnchor.constraint(lessThanOrEqualTo: addToBagButton.topAnchor, constant: -16)
        ])
    }
    
    private func setAddToBagButtonConstraints() {
        NSLayoutConstraint.activate([
            addToBagButton.leftAnchor.constraint(equalTo: productInfoView.leftAnchor, constant: 16),
            addToBagButton.rightAnchor.constraint(equalTo: productInfoView.rightAnchor, constant: -16),
            addToBagButton.heightAnchor.constraint(equalToConstant: 50),
            addToBagButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
}
