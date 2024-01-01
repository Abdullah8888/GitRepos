//
//  UIFont+Extension.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import UIKit

extension UIFont {

    static func nunitosSansBold(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-Bold", size: size) ?? UIFont.systemFont(ofSize: size) }

    static func nunitoSansRegular(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-Regular", size: size) ?? UIFont.systemFont(ofSize: size) }
    
    static func nunitoSansSemiBold(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size) }

    static func nunitoSansExtraBold(size: CGFloat = 14) -> UIFont { UIFont(name: "NunitoSans-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size) }
}

extension CGSize {
    
    init(height: CGFloat) {
        self.init(width: 0, height: height)
    }
    
    init(width: CGFloat) {
        self.init(width: width, height: 0)
    }
}
