//
//  UserListingViewModel.swift
//  GitRepos
//
//  Created by Abdullah on 02/01/2024.
//

import Foundation
import RxSwift

class UserListingViewModel {
    private let getReposUseCase: GetReposUseCaseDelegate
    var reposModel: PublishSubject<[RepoModel]> = PublishSubject<[RepoModel]>()
    var errorHandler: PublishSubject<ErrorModel> = PublishSubject<ErrorModel>()
    
    init(getReposUseCase: GetReposUseCaseDelegate) {
        self.getReposUseCase = getReposUseCase
    }
    
    func getRepos() {
        getReposUseCase.execute { [weak self] response in
            guard let self else { return }
            switch response {
            case .success(let data):
                self.reposModel.onNext(data)
            case .failure(let error):
                self.errorHandler.onNext(error)
            }
        }
    }
}
