//
//  UIView+Ext.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 3/24/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

extension UIView {
    
    func addSubviews (_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
