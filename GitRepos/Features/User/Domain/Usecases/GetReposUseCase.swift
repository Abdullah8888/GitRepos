//
//  GetReposUseCase.swift
//  GitRepos
//
//  Created by Abdullah on 02/01/2024.
//

import Foundation

protocol GetReposUseCaseDelegate {
    func execute(completion: @escaping (Result<[RepoModel], ErrorModel>) -> Void)
}

class GetReposUseCase: GetReposUseCaseDelegate {
    
    private let gitRepoRepository: GitRepoRepositoryDelegate
    
    init(gitRepoRepository: GitRepoRepositoryDelegate) {
        self.gitRepoRepository = gitRepoRepository
    }
    
    func execute(completion: @escaping (Result<[RepoModel], ErrorModel>) -> Void) {
        gitRepoRepository.fetchRepos(completion: completion)
    }
}
