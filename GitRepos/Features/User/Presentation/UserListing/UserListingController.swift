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
    var viewModel: UserListingViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _view.didSelectItemAt = weakify({ strongSelf, repoModel in
            strongSelf.userFlowCoordinator?.showUserDetails(repoModel: repoModel)
        })
        
        _view.showLoaderHandler = weakify({ strongSelf, hasLoaded in
            if hasLoaded {
                strongSelf.showLoader()
            }
            else {
                strongSelf.removeLoader()
            }
        })
        
        viewModel?.reposModel.subscribe(onNext: weakify({ strongSelf, value in
            print("response is \(value.count)")
            print("response isss \(value.first?.name)")
            strongSelf._view.data = value
        })).disposed(by: disposeBag)
        
        viewModel?.errorHandler.subscribe(onNext: weakify({ strongSelf, error in
            strongSelf.showToastWithTitle(error.message, type: .error)
            strongSelf.removeLoader()
        })).disposed(by: disposeBag)
        
        _view.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        
        
        viewModel?.getRepos()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("i've appeared")
    }
    
    @objc func refreshData() {
        print("The refresh guys")
        viewModel?.getRepos()
        _view.refreshControl.endRefreshing()
    }
}
