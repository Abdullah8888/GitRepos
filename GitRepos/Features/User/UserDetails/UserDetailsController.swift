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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view.backgroundColor = .red
    }
}
