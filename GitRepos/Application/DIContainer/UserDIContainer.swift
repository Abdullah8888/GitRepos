//
//  UserDIContainer.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class UserDIContainer {
    
    static let sharedInstance = UserDIContainer()
    fileprivate let appDIContainer = AppDIContainer.sharedInstance
    
    init() {} // This will be in Test and it is a tradeoff that we make between enforceability and simplicity.
    
    // MARK: - Flow Coordinators
    func makeUserFlowCoordinator(navigationController: UINavigationController) -> UserFlowCoordinator {
        return UserFlowCoordinator(navigationController: navigationController, userDIContainer: UserDIContainer.sharedInstance)
    }
    
    func makeUserListingController() -> UserListingController {
        let vc = UserListingController(view: UserListingView())
        return vc
    }
    
    func makeUserDetailsController() -> UserDetailsController {
        let vc = UserDetailsController(view: UserDetailsView())
        return vc
    }
}
