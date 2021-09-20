//
//  RMTitleLabel.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/2/21.
//

import UIKit

// TODO: Why use the RM prefix, it was required for Obj-C but not for Swift (yay, namespaces).
class RMTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(title: String) {
        super.init(frame: .zero)
        self.text = title
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor                   = .systemOrange
        tintColor                   = .systemOrange
        textAlignment               = .left
        font                        = UIFont.preferredFont(forTextStyle: .title2)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.5
    }

}
