//
//  RMBodyLabel.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/3/21.
//

import UIKit

// TODO: Refactor this with RMTitleLabel, too much code duplication for so little differences.
class RMBodyLabel: UILabel {

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
        
        textColor                   = .secondaryLabel
        tintColor                   = .secondaryLabel
        textAlignment               = .left
        font                        = UIFont.preferredFont(forTextStyle: .footnote)
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.5
    }

}
