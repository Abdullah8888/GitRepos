//
//  OnboardingFlowCoordinator.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

final class OnboardingFlowCoordinator: BaseCoordinator {
    
    weak var navigationController: UINavigationController?
    var onboardingDIContainer: OnboardingDIContainer
    
    init(navigationController: UINavigationController, onboardingDIContainer: OnboardingDIContainer) {
        self.navigationController = navigationController
        self.onboardingDIContainer = onboardingDIContainer
    }
    
    override func start() {
        let vc = onboardingDIContainer.makeOnboardingController()
        vc.onboardingFlowCoordinator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
    deinit {
        print("OnboardingFlowCoordinator is now deallocated")
    }
}
