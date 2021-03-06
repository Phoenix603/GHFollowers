//
//  AvatarImageView.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/3/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
    
    let cache = NetworkManager.shared.cache
    let placeholderImage = Images.avatarPalceHolder

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius  = 10
        clipsToBounds       = true
        image               = placeholderImage
    }
}
