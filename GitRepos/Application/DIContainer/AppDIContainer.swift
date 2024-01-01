//
//  AppDIContainer.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
class AppDIContainer {
    
    static let sharedInstance = AppDIContainer()
    
    init() {} // This will be in Test and it is a tradeoff that we make between enforceability and simplicity.
    
    
    // MARK: - DIContainers for Onboadring
    func makeOnboardingDIContainer() -> OnboardingDIContainer {
        return OnboardingDIContainer.sharedInstance
    }
    
    func makeUserDefaultManager() -> UserDefaultManager {
        return UserDefaultManager.shared
    }
}
