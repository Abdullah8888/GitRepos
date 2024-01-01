//
//  AppFlowCoordinator.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}

extension Coordinator {

    func store(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }

    func free(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}

class BaseCoordinator : Coordinator {
    var childCoordinators : [Coordinator] = []
    var isCompleted: (() -> ())?

    func start() {
        fatalError("Children should implement `start`.")
    }
    
    func getRemainingVCs<T: UIViewController>(vcs: [UIViewController], stopVCAt: T.Type) -> [UIViewController]{
        var newVCS = vcs
        var index = newVCS.count-1
        while index > 0 {
            let vc = newVCS[index]
            if !vc.isKind(of: stopVCAt.self) {
                newVCS.remove(at: index)
            }
            else {
                break
            }
            index = index - 1
        }
        return newVCS
    }
}

class AppFlowCoordinator: BaseCoordinator {
  
    let window: UIWindow
    var diContainer: AppDIContainer
    lazy var navigationController = UINavigationController()
    var userDefault: UserDefaultManager {
        diContainer.makeUserDefaultManager()
    }
    
    init(window: UIWindow, diContainer: AppDIContainer) {
        self.window = window
        self.diContainer = diContainer
    }

    override func start() {
        if userDefault.hasSeenOnboarding {
            showHome()
        }
        else {
            window.rootViewController = navigationController
            showOnboarding(navigationController: navigationController)
        }
        window.makeKeyAndVisible()
    }
    
    func showOnboarding(navigationController: UINavigationController) {
        let onboardingDIContainer = diContainer.makeOnboardingDIContainer()
        let onboardingFlow = onboardingDIContainer.makeOnboardingFlowCoordinator(navigationController: navigationController)
        store(coordinator: onboardingFlow)
        onboardingFlow.start()
        onboardingFlow.isCompleted = { [weak self] in
            self?.free(coordinator: onboardingFlow)
        }
    }
    
    func showHome() {
        let rootViewController = UITabBarController()
        window.rootViewController = rootViewController
        
    }
    
    deinit {
        print("AppFlowCoordinator is now deallocated")
    }
}
