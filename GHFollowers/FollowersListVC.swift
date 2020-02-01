//
//  FollowersListVC.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/1/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

class FollowersListVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true

    }

}
