//
//  SelfConfiguringCell.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import UIKit

// TODO: The file should be called `UICollectionReusableViewExtension` to make it clear what it relates to.

/*
 Simple extension that adds the "identifier" property to all UICollectionReusableView,
 it uses its own class name as the identifier so it should always be unique
*/

extension UICollectionReusableView {
    static var identifier: String {
        return "\(self)"
    }
}
