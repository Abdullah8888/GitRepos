//
//  RepoRepository.swift
//  GitRepos
//
//  Created by Abdullah on 02/01/2024.
//

import Foundation
import RealmSwift

protocol GitRepoRepositoryDelegate: AnyObject {
    func fetchRepos(completion: @escaping (Result<[RepoModel], ErrorModel>) -> Void)
    func getUserRepoDetails(userId: String)
}

final class GitRepoRepository: GitRepoRepositoryDelegate {
    
    private let remoteDataSource: RemoteDataSource
    private let realmManager: RealmManagerDelegate
    var reposNotificationToken: NotificationToken?
    private var reposReult: Results<RepoModel>?
    var repoModelObervers: (([RepoModel]) -> ())?
    init(remoteDataSource: RemoteDataSource,realmManager: RealmManagerDelegate) {
        self.remoteDataSource = remoteDataSource
        self.realmManager = realmManager
        startObservingRepos()
    }
    
    func fetchRepos(completion: @escaping (Result<[RepoModel], ErrorModel>) -> Void) {
        remoteDataSource.fetch(relativeUrl: NetworkServiceConstant.GET_REPOSITORIES, method: .get, type: [RepoModel].self, payload: nil) { [weak self] result in
            print("lala")
            switch result {
            case .success(let res):
                
                self?.realmManager.save(items: res)
                //completion(.success(res))
            case .failure(let error):
                completion(.failure(ErrorModel(message: error.message)))
            }
        }
        
        self.repoModelObervers = {  res in
            completion(.success(res))
            print("from db us \(res.count)")
        }
    
    }
    
    func getUserRepoDetails(userId: String) {
        
    }
    
    
    func startObservingRepos() {
        reposReult = realmManager.realm.objects(RepoModel.self)
        reposNotificationToken = reposReult?.observe({ [weak self] realmCollectionChanges in
            switch realmCollectionChanges {
            case .initial(let results):
                print("At initial, message results are now populated and can be accessed without blocking the UI, \(results.count)")
                self?.repoModelObervers?(results.array)
                
            case .update(let results, deletions: let deletions, insertions: let insertions, modifications: let modifications):
                print("widget deletion count: \(deletions.count)")
                print("widget insertion count: \(insertions.count)")
                print("widget modification count: \(modifications.count)")
                print("At update")
                print("resulto is \(results.array.count)")
                self?.repoModelObervers?(results.array)
                
            case .error(let error):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(error)")
            }
        })
    }
}

