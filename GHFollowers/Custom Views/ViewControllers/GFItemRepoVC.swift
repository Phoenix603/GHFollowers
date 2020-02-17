//
//  GFItemRepoVC.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/14/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

class GFItemRepoVC: GFItemInfoVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()    
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }

}
