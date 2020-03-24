//
//  UIHelper.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/4/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

enum UIHelper {
    static func createThreeColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width               = view.bounds.width
        let padding: CGFloat    = 12
        let spacing: CGFloat    = 10
        let availableWidth      = width - 2 * padding - 2 * spacing
        let itemWidth           = availableWidth / 3
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize     = CGSize(width: itemWidth, height: itemWidth + 40)
        
        return flowLayout
    }
}
