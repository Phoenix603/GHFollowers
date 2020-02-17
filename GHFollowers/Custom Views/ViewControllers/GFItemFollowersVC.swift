//
//  GFItemFollowersVC.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/14/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

class GFItemFollowersVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
