//
//  ReposContorller.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class UserListingController: BaseController<UserListingView> {
    
    weak var userFlowCoordinator: UserFlowCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view.backgroundColor = .blue
    }
}
