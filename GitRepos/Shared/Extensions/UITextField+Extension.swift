//
//  UITextField+Extension.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import UIKit

extension UITextField {
	
	func iconRight(image: UIImage, frame: CGRect) {
		let iconView = UIImageView (frame: frame)
		iconView.image = image
		iconView.contentMode = .scaleAspectFit
		iconView.tintColor = .lightGray
		
		let iconViewContainer: UIView = UIView (frame: CGRect(x: 50, y: 0, width: 40, height: 30))
		iconViewContainer.addSubview(iconView)
		rightView = iconViewContainer
		rightViewMode = .always
	}

	func addLeftIcon(_ image: UIImage?, imageUrl: String?, cornerRadius: CGFloat?) {
		let iconView = UIImageView (frame: CGRect(x: 10, y: 10, width: 30, height: 30))
		iconView.contentMode = .scaleAspectFill
		let iconViewContainer: UIView = UIView (frame: CGRect(x: 20, y: 20, width: 60, height: 60))
		iconViewContainer.addSubview(iconView)
		iconView.cornerRadius = cornerRadius ?? 0
		leftView = iconViewContainer
		leftViewMode = .always
		if let url = imageUrl, let placeholderImage = UIImage(named: "empty_profile_picture") {
			iconView.showUrlImage(url: url, placeHolderImage: placeholderImage)
		} else {
			iconView.image = image
		}
	}
	
}
