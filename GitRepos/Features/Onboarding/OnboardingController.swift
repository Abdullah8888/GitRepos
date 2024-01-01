//
//  OnbordingController.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import UIKit

class OnboardingController: BaseController<OnboardingView> {
    
    weak var onboardingFlowCoordinator: OnboardingFlowCoordinator?
    var userDefault: UserDefaultManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _view.onboardingData = OnboardingModel().data
        
        _view.getStartedButton.onClick(completion: weakify({ strongSelf in
            strongSelf.onboardingFlowCoordinator?.showUserLisiting()
        }))
    }
}
