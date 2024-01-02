//
//  UserDetailsController.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class UserDetailsController: BaseController<UserDetailsView> {
    
    weak var userFlowCoordinator: UserFlowCoordinator?
    var repoModel: RepoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNavbar()
        
        backArrowHandler = weakify({ strongSelf in
            strongSelf.userFlowCoordinator?.pop()
        })
        
        updateViewWithData(repoModel: repoModel)
    }
    
    func updateViewWithData(repoModel: RepoModel?) {
        let fullName = repoModel?.fullName?.replacingOccurrences(of: "/", with: " ")
        _view.nameLabel.text = fullName?.capitalized
        _view.aboutContentLabel.text = repoModel?.repoDescription ?? "Not found"
        _view.userImageView.showImage(url: repoModel?.owner?.avatarUrl ?? "")
    }
}
