//
//  OnboardingFlowCoordinator.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

final class OnboardingFlowCoordinator: BaseCoordinator {
    
     var navigationController: UINavigationController
    var onboardingDIContainer: OnboardingDIContainer
    
    init(navigationController: UINavigationController, onboardingDIContainer: OnboardingDIContainer) {
        self.navigationController = navigationController
        self.onboardingDIContainer = onboardingDIContainer
    }
    
    override func start() {
        let vc = onboardingDIContainer.makeOnboardingController()
        vc.onboardingFlowCoordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showUserLisiting() {
        let userDIContainer = AppDIContainer.sharedInstance.makeUserDIContainer()
        let userFlow = userDIContainer.makeUserFlowCoordinator(navigationController: navigationController)
        store(coordinator: userFlow)
        userFlow.start()
        userFlow.isCompleted = { [weak self] in
            self?.free(coordinator: userFlow)
        }
   }
    
    deinit {
        print("OnboardingFlowCoordinator is now deallocated")
    }
}
