//
//  UserInfoVC.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/5/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!
    weak var delegate: FollowersListVCDelegate!
    
    let headerView  = UIView()
    let itemViewOne = UIView()
    let itemViewTwo = UIView()
    let dateLabel   = GFBodyLabel(textAlignment: .center)
    //var itemViews   = [UIView]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        layoutUI()
        getUserInfo()
    }
    
    @objc func dismissVC() {
        dismiss(animated: true)
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo() {
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
       
            switch result {
            case .success(let user):
                DispatchQueue.main.async { self.configureUIElements(with: user) }
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "OK")
            }
        }
    }
    
    func configureUIElements(with user: User) {
                
        self.add(childVC: GFUserInfoHeaderVC    (user: user),                   to: self.headerView)
        self.add(childVC: GFItemRepoVC          (user: user, delegate: self),   to: self.itemViewOne)
        self.add(childVC: GFItemFollowersVC     (user: user, delegate: self),   to: self.itemViewTwo)
        
        self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
    }
    
    func layoutUI() {
        
        let padding: CGFloat        = 20
        let itemHeight: CGFloat     = 140
        let itemViews               = [headerView, itemViewOne, itemViewTwo, dateLabel]
        let itemHeights             = [itemHeight + 40, itemHeight, itemHeight, 40]
        let topAnchors              = [view.safeAreaLayoutGuide.topAnchor, headerView.bottomAnchor, itemViewOne.bottomAnchor, itemViewTwo.bottomAnchor]
        
        for (index, itemView) in itemViews.enumerated()  {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                itemView.topAnchor.constraint(equalTo: topAnchors[index], constant: padding),
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                itemView.heightAnchor.constraint(equalToConstant: itemHeights[index])
            ])
        }
    }
    
    func add(childVC:UIViewController, to containerView:UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }

}

extension UserInfoVC: GFItemRepoVCDelegate {
    
    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentGFAlertOnMainThread(title: "Invalid URL", message: "The URL attached to this user is invalid", buttonTitle: "OK")
            return
        }
        self.presentSafariVC(with: url)
    }
}

extension UserInfoVC: GFItemFollowersVCDelegate {
    
    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentGFAlertOnMainThread(title: "No Followers", message: "This user has no followers. What a shame 😞", buttonTitle: "OK")
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismissVC()
    }
}
