//
//  RecentRepoCell.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class RecentRepoCell: BaseTableViewCell {
    
    let cellContainerView: UIView = {
        let view = UIView()
        view.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.hexE8E6E6.cgColor
        return view
    }()
    
    let folderIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "material-symbols-light_folder"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let repoNameLabel: Label = {
        let label = Label(text: ".devops", font: .nunitoSansRegular(size: 14), textColor: .black)
        return label
    }()
    
    let timeLabel: Label = {
        let label = Label(text: "1 hour ago", font: .nunitoSansRegular(size: 14), textColor: .black)
        return label
    }()
    
    let repoCommitLabel: Label = {
        let label = Label(text: "devops: added systemized units and set versioning date", font: .nunitoSansRegular(size: 12), textColor: .hex7B7B7B)
        return label
    }()
    
    override func setup() {
        super.setup()
        addSubview(cellContainerView)
        cellContainerView.fillUpSuperview(margin: .topOnly(15))
        
        cellContainerView.addSubviews(folderIcon, repoNameLabel, timeLabel, repoCommitLabel)
        folderIcon.anchor(top: cellContainerView.topAnchor, leading: cellContainerView.leadingAnchor, margin: .topLeftOnly(15, 15))
        
        repoNameLabel.anchor(top: cellContainerView.topAnchor, leading: folderIcon.trailingAnchor, margin: .topLeftOnly(15, 15))

        timeLabel.anchor(top: cellContainerView.topAnchor, trailing: cellContainerView.trailingAnchor, margin: .topRightOnly(15, 15))


        repoCommitLabel.anchor(top: folderIcon.bottomAnchor, leading: cellContainerView.leadingAnchor, trailing: cellContainerView.trailingAnchor, margin: .topLeftOnly(13, 15))
    }
    
    func updateData(imageName: String, header: String, subHeader: String) {
        
    }
}
