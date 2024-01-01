//
//  UserDefaultManager.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
final class UserDefaultManager {
    
    static var shared: UserDefaultManager = UserDefaultManager()
    
    fileprivate init() {}
    
    @UserDefaultPrimitive(key: UserDefaultConstants.HAS_SEEN_ONBOARDING, default: false)
    var hasSeenOnboarding: Bool
}
