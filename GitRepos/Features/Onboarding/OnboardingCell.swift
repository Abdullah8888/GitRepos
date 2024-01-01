//
//  OnboardingCell.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class OnboardingCell: BaseCollectionViewCell {
    
    let imageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let headerLabel: Label = {
        let label = Label(text: "", font: .nunitosSansBold(size: 24), textColor: .black, alignment: .center)
        return label
    }()
    
    let subHeaderLabel: Label = {
        let label = Label(text: "", font: .nunitoSansRegular(size: 16), textColor: .hex7B7B7B, alignment: .center)
        return label
    }()
    
    override func setup() {
        super.setup()
        addSubviews(imageView, subHeaderLabel, headerLabel)
        subHeaderLabel.anchor(leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
        
        headerLabel.anchor(leading: leadingAnchor, bottom: subHeaderLabel.topAnchor, trailing: trailingAnchor)
        
        imageView.anchor(top: topAnchor, leading: leadingAnchor, bottom: headerLabel.topAnchor, trailing: trailingAnchor)
        
    }
    
    func updateData(imageName: String, header: String, subHeader: String) {
        imageView.image = UIImage(named: imageName)
        headerLabel.text = header
        subHeaderLabel.text = subHeader
    }
}
