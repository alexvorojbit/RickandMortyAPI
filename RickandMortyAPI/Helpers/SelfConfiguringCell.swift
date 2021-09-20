//
//  SelfConfiguringCell.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import UIKit

/*
 Simple extension that adds the "identifier" property to all UICollectionReusableView,
 it uses its own class name as the identifier so it should always be unique
*/

extension UICollectionReusableView {
    static var identifier: String {
        return "\(self)"
    }
}
