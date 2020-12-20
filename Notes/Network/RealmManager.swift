//
//  RealmManager.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//

import Foundation
import RealmSwift

class RealmManager {
    
    private var realm: Realm?
    private var configuration: Realm.Configuration?
    
    init(
        configuration: Realm.Configuration? = .defaultConfiguration
    ) {
        self.configuration = configuration
        self.realm = self.createRealm(from: configuration)
    }
    
    private func createRealm(
        from configuration: Realm.Configuration?
    ) -> Realm {
         do {
             if let config = configuration {
                 return try Realm(configuration: config)
             } else {
                 return try Realm()
             }
         } catch let error {
             fatalError(error.localizedDescription)
         }
     }
    
    func addObj<T: Object>(
        obj: T,
        then handler: @escaping (Result<Void, RealmError>) -> Void
    ) {
        do {
            try realm?.write {
                self.realm?.add(obj, update: .modified)
                handler(.success)
            }
        } catch {
            handler(.failure(.genericError(error.localizedDescription)))
        }
    }
    
    func getObject<T: Object>(
        object: T.Type,
        forKey key: Any,
        then handler: (Result<T, RealmError>) -> Void
    ) {
        if let result = realm?.object(ofType: T.self, forPrimaryKey: key) {
            handler(.success(result))
        } else {
            handler(.failure(.objectNotFound))
        }
    }
    
    func deleteObj<T: Object>(
        object: T.Type,
        forKey key: Any,
        then handler: @escaping (Result<Void, RealmError>) -> Void
    ) {
        do {
            try self.realm?.write {
                self.getObject(object: object, forKey: key) { result in
                    switch result {
                    case .success(let object):
                        self.realm?.delete(object)
                        handler(.success)
                    case .failure(let error):
                        handler(.failure(error))
                    }
                }
            }
        } catch {
            let realmError = RealmError.genericError(error.localizedDescription)
            handler(.failure(realmError))
        }
    }
    
    func getAllDb<T: Object>(
        object: T.Type,
        byKeyPath: String,
        then handler: @escaping (Result<Results<T>, RealmError>) -> Void
    ) {
        if let result = realm?.objects(T.self).sorted(byKeyPath: byKeyPath) {
            handler(.success(result))
        } else {
            handler(.failure(.objectNotFound))
        }
    }
}
