//
//  ReposModel.swift
//  GitRepos
//
//  Created by Abdullah on 02/01/2024.
//

import Foundation
import RealmSwift

// MARK: - ReposModel
class RepoModel: Object, Codable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var nodeID: String?
    @Persisted var name: String?
    @Persisted var fullName: String?
    @Persisted var welcomePrivate: Bool?
    @Persisted var repoDescription: String?
    @Persisted var owner: RepoOwner?

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case welcomePrivate = "private"
        case repoDescription = "description"
        case owner
    }
}

// MARK: - RepoOwner
class RepoOwner: Object, Codable {
    @Persisted var login: String?
    @Persisted var id: Int?
    @Persisted var avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
    }
}

