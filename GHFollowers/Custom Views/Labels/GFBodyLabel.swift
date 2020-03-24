//
//  GFBodyLabel.swift
//  GHFollowers
//
//  Created by Aleksei Zakharov on 2/3/20.
//  Copyright © 2020 Aleksei Zakharov. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init (textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints   = false
        adjustsFontForContentSizeCategory           = true
        adjustsFontSizeToFitWidth                   = true
        font                                        = UIFont.preferredFont(forTextStyle: .body)
        textColor                                   = .secondaryLabel
        minimumScaleFactor                          = 0.75
        lineBreakMode                               = .byWordWrapping
    }
}
