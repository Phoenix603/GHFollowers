//
//  GFItemRepoVC.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/14/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

protocol GFItemRepoVCDelegate: class {
    func didTapGitHubProfile(for user: User)
}

class GFItemRepoVC: GFItemInfoVC {
    
    weak var delegate: GFItemRepoVCDelegate!
    
    init(user: User, delegate: GFItemRepoVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
