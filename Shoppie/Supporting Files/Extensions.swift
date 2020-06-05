//
//  Extensions.swift
//  Shoppie
//
//  Created by Min Thet Maung on 04/06/2020.
//  Copyright © 2020 Myanmy. All rights reserved.
//

import UIKit

extension UIColor {
    func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
    }
}


extension UIView {
    
    func constraintsWithVisualFormat(format: String, views: UIView...) {
        var viewsDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            viewsDict["v\(index)"] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDict))
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superView.topAnchor),
            bottomAnchor.constraint(equalTo: superView.bottomAnchor),
            leadingAnchor.constraint(equalTo: superView.leadingAnchor),
            trailingAnchor.constraint(equalTo: superView.trailingAnchor),
        ])
    }
}
