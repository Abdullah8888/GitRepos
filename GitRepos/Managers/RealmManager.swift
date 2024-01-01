//
//  RealmManager.swift
//  GitRepos
//
//  Created by Abdullah on 01/01/2024.
//

import Foundation
import RealmSwift
import Realm

protocol RealmManagerDelegate {
    var realm: Realm { get set}
    var didUpdate: ((Realm) -> ())? { get set }
    func save<T: Object>(items: [T])
    func save<T: Object>(item: T)
    func asyncSave<T: Object>(items: [T])
    func asyncSave<T: Object>(item: T)
    func reSave<T: Object>(items: [T])
    func objects<T: Object>(_ type: T.Type) -> [T]
    func objects<T: Object>() -> [T]
    func getObjectById<T: Object>(type: T.Type, id: Int) -> T?
    func clear<T: Object>(_ type: T.Type)
    func clearAll()
    func clear(_ obj: Object)
    func startObserving()
    func stopObserving()
    func hasObject<T: RealmSwiftObject>(of type: T.Type, id: String) -> Bool
}

class RealmManager: RealmManagerDelegate {
    
    static let sharedInstance = RealmManager()
    var  token: NotificationToken?
    var didUpdate: ((Realm) -> ())?
    var realm: Realm {
        get {
            let config = Realm.Configuration.defaultConfiguration
            return try! Realm(configuration: config) // The code crashed here
        }
        set {}
    }
    
    func startObserving() {
        token = realm.observe { [weak self] notification, realm in
            print("Updated realm with new data")
            self?.didUpdate?(realm)
        }
    }
    
    func stopObserving() {
        token?.invalidate()
    }
    
    func asyncSave<T: Object>(items: [T]) {
        realm.writeAsync({[weak self] in
            self?.realm.add(items, update: .modified)
        }, onComplete: { error in
            print("Realm DB => \(String(describing: error))")
            print("Realm DB => \(String(describing: error?.localizedDescription))")
        })
    }
    
    func asyncSave<T: Object>(item: T) {
        realm.writeAsync({[weak self] in
            self?.realm.add(item, update: .modified)
        }, onComplete: { error in
            print("Realm DB => \(String(describing: error))")
            print("Realm DB => \(String(describing: error?.localizedDescription))")
        })
    }
    
    func save<T: Object>(items: [T]) {
        try! realm.write {
            realm.add(items, update: .modified)
        }
    }
    
    func save<T: Object>(item: T) {
        try! realm.write {
            realm.add(item, update: .modified)
        }
    }
    
    func reSave<T: Object>(items: [T]) {
        clear(T.self)
        try! realm.write {
            realm.add(items, update: .modified)
        }
    }
    
    func objects<T: Object>(_ type: T.Type) -> [T] {
        realm.objects(type).array
    }
    
    func objects<T: Object>() -> [T] {
        realm.objects(T.self).array
    }
    
    func getObjectById<T: Object>(type: T.Type, id: Int) -> T? {
        realm.object(ofType: type, forPrimaryKey: id)
    }
    
    func clear<T: Object>(_ type: T.Type) {
        try! realm.write {
            let obj = realm.objects(type)
            realm.delete(obj)
        }
    }
    
    func clear(_ obj: Object) {
        try! realm.write {
            realm.delete(obj)
        }
    }
    
    func clearAll() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func hasObject<T: RealmSwiftObject>(of type: T.Type, id: String) -> Bool {
        let check = realm.object(ofType: type.self, forPrimaryKey: id)
        return check == nil ? false : true
    }
}


extension Results {
    
    var array: [Element] { map { $0 } }
    
    func getItemSafely(index: Int) -> Object? {
        if self.indices.contains(index) {
            return self[index] as? Object
        }
        return nil
    }
    
    func lastIndex() -> Int {
        if self.count > 0 {
            return self.count - 1
        }
        return 0
    }
}

extension List {
    var array: [Element] { map { $0 } }
}
