//
//  ReposView.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class UserListingView: BaseView {
    
    let headerLabel: Label = {
        let label = Label(text: "GitHub Explorer", font: .nunitosSansBold(size: 20), textColor: .black)
        return label
    }()
    
    let subHeaderLabel: Label = {
        let label = Label(text: "Connect and Collaborate with the Community", font: .nunitoSansRegular(size: 16), textColor: .hex7B7B7B)
        return label
    }()
    
    let bellIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "bell"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let slidersIcon: UIImageView = {
        let img = UIImageView(image: UIImage(named: "sliders"))
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let searchBarContainerView: UIView = {
        let view = UIView()
        view.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.hexA5A5A5.cgColor
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.backgroundColor = .white
        searchBar.isTranslucent = false
        searchBar.placeholder = "Search Users by Name or Email"
        searchBar.delegate = self
        let searchImg = UIImage(named: "search")
        searchImg?.withTintColor(.hex7765C4).withRenderingMode(.alwaysTemplate)
        searchBar.setImage(searchImg, for: .search, state: .normal)
        searchBar.backgroundImage = UIImage()
        searchBar.barTintColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()
    
    let repoCell = String(describing: RepoCell.self)
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        //tableView.separatorStyle = .singleLine
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.register(RepoCell.self, forCellReuseIdentifier: repoCell)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.refreshControl = refreshControl
        return tableView
    }()
    
    let refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        return refreshControl
    }()
    
    var didSelectItemAt: ((RepoModel?) -> ())?
    
    var showLoaderHandler: ((Bool) -> ())?
    
    var data: [RepoModel]? {
        didSet {
            if data?.isEmpty ?? false {
                showLoaderHandler?(true)
            }
            else {
                showLoaderHandler?(false)
            }
            tableView.reloadData()
        }
    }
    
    override func setup() {
        super.setup()
        addSubviews(headerLabel, bellIcon, subHeaderLabel, searchBarContainerView, tableView)
        headerLabel.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, margin: .topLeftOnly(10, 20))
        
        bellIcon.anchor(top: safeAreaLayoutGuide.topAnchor, trailing: trailingAnchor, margin: .topRightOnly(10, 20))
        
        subHeaderLabel.anchor(top: headerLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: 5, left: 20, bottom: 0, right: 20))
        
        searchBarContainerView.anchor(top: subHeaderLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, margin: .init(top: 30, left: 20, bottom: 0, right: 20))
        
        tableView.anchor(top: searchBarContainerView.bottomAnchor,  leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, margin: .init(top: 10, left: 20, bottom: 0, right: 20))
        
        searchBarContainerView.addSubviews(searchBar, slidersIcon)
        
        slidersIcon.anchor(top: searchBarContainerView.topAnchor, bottom: searchBarContainerView.bottomAnchor, trailing: searchBarContainerView.trailingAnchor, margin: .rightOnly(20))
        
        searchBar.anchor(top: searchBarContainerView.topAnchor, leading: searchBarContainerView.leadingAnchor, bottom: searchBarContainerView.bottomAnchor, trailing: slidersIcon.leadingAnchor)
        
    }
}

extension UserListingView: UISearchBarDelegate {
    
}

extension UserListingView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data?.count ?? 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: repoCell, for: indexPath) as! RepoCell
        
        if let data = data?[indexPath.item] {
            cell.updateData(data: data)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItemAt?(data?[indexPath.item])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        115
    }
}


