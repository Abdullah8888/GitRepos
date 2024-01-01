//
//  sdfadsf.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class OnboardingDIContainer {
    
    static let sharedInstance = OnboardingDIContainer()
    fileprivate let appDIContainer = AppDIContainer.sharedInstance
    
    init() {} // This will be in Test and it is a tradeoff that we make between enforceability and simplicity.
    
    // MARK: - Flow Coordinators
    func makeOnboardingFlowCoordinator(navigationController: UINavigationController) -> OnboardingFlowCoordinator {
        return OnboardingFlowCoordinator(navigationController: navigationController, onboardingDIContainer: OnboardingDIContainer.sharedInstance)
    }
    
    func makeOnboardingController() -> OnboardingController {
        let vc = OnboardingController(view: OnboardingView())
        vc.userDefault = appDIContainer.makeUserDefaultManager()
        return vc
    }
}
