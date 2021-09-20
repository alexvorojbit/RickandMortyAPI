//
//  UIHelper.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 9/4/21.
//

import Foundation
import UIKit

struct UIHelper {
    
    static func createRowsFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 16
        let availableWidth              = width - (padding * 2)
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: availableWidth, height: 100)
        flowLayout.minimumLineSpacing = padding + 4
        
        return flowLayout
    }
}
