//
//  RepoFlowCoordinator.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

final class UserFlowCoordinator: BaseCoordinator {
    
    weak var navigationController: UINavigationController?
    var userDIContainer: UserDIContainer
    
    init(navigationController: UINavigationController, userDIContainer: UserDIContainer) {
        self.navigationController = navigationController
        self.userDIContainer = userDIContainer
    }
    
    override func start() {
        let vc = userDIContainer.makeUserListingController()
        vc.userFlowCoordinator = self
        navigationController?.setViewControllers([vc], animated: false)
    }
    
    func showUserDetails(repoModel: RepoModel?) {
        let vc = userDIContainer.makeUserDetailsController()
        vc.userFlowCoordinator = self
        vc.repoModel = repoModel
        navigationController?.pushViewController(vc, animated: false)
    }
    
    func pop() {
        navigationController?.popViewController(animated: false)
    }
    
    deinit {
        print("UserFlowCoordinator is now deallocated")
    }
}
