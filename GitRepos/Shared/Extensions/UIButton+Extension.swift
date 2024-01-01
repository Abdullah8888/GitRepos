//
//  UIButton+Extension.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import UIKit
import SDWebImage

extension UIButton {
  
  func showImage(imgUrl: String?) {
    let url = URL(string: imgUrl ?? "")
    sd_setBackgroundImage(with: url, for: .normal, placeholderImage: UIImage())
  }
    
    func showImage(imgUrl: String?, _  completion: @escaping (_ done: Bool) -> Void) {
      let url = URL(string: imgUrl ?? "")
        sd_setBackgroundImage(with: url, for: .normal) { _, err, _, _ in
            if err == nil {
                completion(true)
            }
        }
    }
}

enum ImagePosition {
	case left, right, top, bottom
}

extension UIButton {
	func disableButton() {
		self.isEnabled = false
	}
	
	func enableButton() {
		self.isEnabled = true
	}
	
	func setButtonWithTitleAndImage(fontSize : CGFloat = 15, textColor: UIColor, tintColor : UIColor, buttonImage: UIImage?, imagePosition: ImagePosition = .left, imageSizeHW: CGFloat = 30) {
				if imageView != nil {
					let image = buttonImage?.withRenderingMode(.alwaysTemplate)
					self.setImage(image, for: .normal)
					self.setTitleColor(textColor, for: .normal)
					self.tintColor = tintColor
					
					switch imagePosition{
					case .left:
						imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: (bounds.width - (imageSizeHW + 5)))
						titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
					case .right:
						imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - (imageSizeHW + 5)), bottom: 5, right: 5)
						titleEdgeInsets = UIEdgeInsets(top: 0, left: (imageView?.frame.width)!, bottom: 0, right: 0)
					case .top:
						imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: (bounds.width - (imageSizeHW + 5)), right: 5)
						titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: (imageView?.frame.height)!, right: 0)
					case .bottom:
						imageEdgeInsets = UIEdgeInsets(top: (bounds.width - (imageSizeHW + 5)), left: 5, bottom: 5, right: 5)
						titleEdgeInsets = UIEdgeInsets(top: (imageView?.frame.height)!, left: 0, bottom: 0, right: 0)
					}
				}
				self.layoutIfNeeded()
			}
}
