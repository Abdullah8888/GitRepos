//
//  RepoCell.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class RepoCell: BaseTableViewCell {
    
    let nameLabel: Label = {
        let label = Label(text: "Emily Smith", font: .nunitoSansRegular(size: 16), textColor: .black)
        return label
    }()
    
    let locationLabel: Label = {
        let label = Label(text: "San Francisco, CA", font: .nunitoSansRegular(size: 14), textColor: .hex7B7B7B)
        return label
    }()
    
    lazy var userDetailsStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [nameLabel,locationLabel])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let numberOfCommits: Label = {
        let label = Label(text: "30+", font: .nunitoSansRegular(size: 24), textColor: .hex18A532, alignment: .right)
        return label
    }()
    
    let commitsLabel: Label = {
        let label = Label(text: "Commits", font: .nunitoSansRegular(size: 14), textColor: .hex7B7B7B, alignment: .right)
        return label
    }()
    
    lazy var commitStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [numberOfCommits,commitsLabel])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let userImageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "sample_user_icon"))
        img.contentMode = .scaleAspectFit
        img.cornerRadius = 30
        img.clipsToBounds = true;
        return img
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = .hexE8E6E6
        view.constrainHeight(constant: 1)
        return view
    }()
    
    override func setup() {
        super.setup()
        addSubviews(userImageView, userDetailsStackView, commitStackView, dividerView)
        userImageView.anchor(top: topAnchor, leading: leadingAnchor, margin: .topOnly(25), size: .init(width: 60, height: 60))
        
        commitStackView.anchor(top: userImageView.topAnchor, trailing: trailingAnchor, margin: .topOnly(7))
        
        userDetailsStackView.anchor(top: userImageView.topAnchor, leading: userImageView.trailingAnchor, bottom: userImageView.bottomAnchor, trailing: commitStackView.leadingAnchor, margin: .init(top: 7, left: 13, bottom: 7, right: 13))
        
        dividerView.anchor( leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor)
    }
    
    func updateData(imageName: String, header: String, subHeader: String) {
        
    }
    
    func updateData(data: RepoModel) {
        let fullName = data.fullName?.replacingOccurrences(of: "/", with: " ")
        nameLabel.text = fullName?.capitalized
        userImageView.showImage(url: data.owner?.avatarUrl ?? "")
    }
}
