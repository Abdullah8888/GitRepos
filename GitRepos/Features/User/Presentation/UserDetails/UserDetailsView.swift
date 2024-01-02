//
//  UserDetailsView.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class UserDetailsView: BaseView {
    
    let nameLabel: Label = {
        let label = Label(text: "Emily Smith", font: .nunitosSansBold(size: 16), textColor: .black)
        return label
    }()
    
    let emailLabel: Label = {
        let label = Label(text: "Email: marcus.j@example.com", font: .nunitoSansRegular(size: 12), textColor: .hex7B7B7B)
        return label
    }()
    
    let locationLabel: Label = {
        let label = Label(text: "Location: San Francisco, CA.", font: .nunitoSansRegular(size: 12), textColor: .hex7B7B7B)
        return label
    }()
    
    let numberOfCommitsLabel: Label = {
        let label = Label(text: "30,000 Commits", font: .nunitoSansRegular(size: 12), textColor: .hex18A532)
        return label
    }()
    
    let aboutLabel: Label = {
        let label = Label(text: "About", font: .nunitosSansBold(size: 14), textColor: .black)
        return label
    }()
    
    let aboutContentLabel: Label = {
        let label = Label(text: "Emily Smith, based in New York City, is a passionate coder specializing in web development. With a focus on crafting user-friendly interfaces, she explores React's potential while actively contributing to open-source projects. Her dedication extends to mentoring and community-driven initiatives, aiming to innovate and solve real-world problems through technology", font: .nunitoSansRegular(size: 12), textColor: .hex7B7B7B)
        return label
    }()
    
    let recentRepoHeaderLabel: Label = {
        let label = Label(text: "Recent Repositories", font: .nunitosSansBold(size: 14), textColor: .black)
        return label
    }()
    
    let recentRepoSubHeaderLabel: Label = {
        let label = Label(text: "Navigate their codebase and development history", font: .nunitoSansRegular(size: 12), textColor: .hex7B7B7B)
        return label
    }()
    
    lazy var userDetailsStackView: UIStackView = {
        let stackView = UIStackView.init(arrangedSubviews: [nameLabel,emailLabel, locationLabel, numberOfCommitsLabel])
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.backgroundColor = .white
        return stackView
    }()
    
    let userImageView: UIImageView = {
        let img = UIImageView(image: UIImage(named: "sample_user_icon"))
        img.contentMode = .scaleAspectFit
        img.cornerRadius = 50
        img.clipsToBounds = true;
        return img
    }()
    
    let recentRepoCell = String(describing: RecentRepoCell.self)
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RecentRepoCell.self, forCellReuseIdentifier: recentRepoCell)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .purple
        return tableView
    }()
    
    var didSelectItemAt: ((Int) -> ())?
    
    override func setup() {
        super.setup()
        
        addSubviews(userImageView, userDetailsStackView, aboutLabel, aboutContentLabel, recentRepoHeaderLabel, recentRepoSubHeaderLabel, tableView)
        userImageView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, margin: .topLeftOnly(20, 20), size: .init(width: 100, height: 100))
   
        userDetailsStackView.anchor(top: userImageView.topAnchor, leading: userImageView.trailingAnchor, bottom: userImageView.bottomAnchor, trailing: trailingAnchor, margin: .init(top: 7, left: 13, bottom: 7, right: 13))
        
        aboutLabel.anchor(top: userImageView.bottomAnchor, leading: userImageView.leadingAnchor, trailing: userDetailsStackView.trailingAnchor, margin: .topOnly(33))
        
        aboutContentLabel.anchor(top: aboutLabel.bottomAnchor, leading: userImageView.leadingAnchor, trailing: userDetailsStackView.trailingAnchor, margin: .topOnly(10))
        
        recentRepoHeaderLabel.anchor(top: aboutContentLabel.bottomAnchor, leading: userImageView.leadingAnchor, trailing: userDetailsStackView.trailingAnchor, margin: .topOnly(40))
        
        recentRepoSubHeaderLabel.anchor(top: recentRepoHeaderLabel.bottomAnchor, leading: userImageView.leadingAnchor, trailing: userDetailsStackView.trailingAnchor, margin: .topOnly(10))
        
        tableView.anchor(top: recentRepoSubHeaderLabel.bottomAnchor, leading: userImageView.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: userDetailsStackView.trailingAnchor, margin: .topOnly(17))
    }
}


extension UserDetailsView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //data?.count ?? 0
        10
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: recentRepoCell, for: indexPath) as! RecentRepoCell
        //cell.titleLabel.text = data[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItemAt?(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        113
    }
}
