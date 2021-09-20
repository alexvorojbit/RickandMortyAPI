//
//  Extensions.swift
//  RickandMortyAPI
//
//  Created by Alexandru Vorojbit on 10.09.2021.
//

import UIKit

extension UIView {
    
    // MARK: - Round Corners -
    
    func roundCorners(_ corners: UIRectCorner, radius: Double) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
        layer.masksToBounds = false
    }
}

extension UINavigationBar {
    func changeFont() {
        self.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name:"Poppins-Medium", size: 17)!]
    }
}
