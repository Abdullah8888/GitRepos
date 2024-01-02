//
//  ReposModel.swift
//  GitRepos
//
//  Created by Abdullah on 02/01/2024.
//

import Foundation
// MARK: - ReposModel
struct RepoModel: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let welcomePrivate: Bool
    let owner: RepoOwner

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case welcomePrivate = "private"
        case owner
    }
}

// MARK: - RepoOwner
struct RepoOwner: Codable {
    let login: String
    let id: Int
}

