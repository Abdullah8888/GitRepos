//
//  UserDefault+Util.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
@propertyWrapper
struct UserDefaultPrimitive<T> {
    private let key: String
    private let defaultValue: T
    
    private let userDefaults = UserDefaults.standard
    
    init(key: String, default: T) {
        self.key = key
        self.defaultValue = `default`
    }
    
    var wrappedValue: T {
        get { (userDefaults.object(forKey: key) as? T) ?? defaultValue }
        set { userDefaults.set(newValue, forKey: key) }
    }
}
