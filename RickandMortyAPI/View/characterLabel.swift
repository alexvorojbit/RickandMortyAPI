//
//  RMTitleLabel.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/2/21.
//

import UIKit

class characterLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    init(font: UIFont, textColor: UIColor) {
        super.init(frame: .zero)
        self.font = font
        self.textColor = textColor
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        textAlignment               = .left
        adjustsFontSizeToFitWidth   = true
        minimumScaleFactor          = 0.5
    }

}
