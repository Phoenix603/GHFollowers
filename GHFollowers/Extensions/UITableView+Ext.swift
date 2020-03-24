//
//  UITableView+Ext.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 3/24/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

extension UITableView {
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    func removeExceesCells() {
        tableFooterView = UIView(frame: .zero)
    }
}
