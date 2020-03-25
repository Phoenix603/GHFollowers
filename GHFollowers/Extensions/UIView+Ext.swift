//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 3/24/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    func addSubviews (_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
