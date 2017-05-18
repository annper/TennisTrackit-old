//
//  RealmStore.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmStore {
    
    public let sliceSize = 100
    
    private var databaseFilename: String!
    
    static let sharedStore = RealmStore(databaseFilename: "db.realm.tennis")
    
    // MARK: - RealmStore
    
    private func setupSharedRealm() {
        var config = Realm.Configuration()
        
        let directory = URL(fileURLWithPath: NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true)[0])
        
        // set the realm path
        config.fileURL = URL(string: directory.path + "/" + databaseFilename)
        
        // update the default realm config
        Realm.Configuration.defaultConfiguration = config
        
        print("Realm() path: \(config.fileURL!)")
    }
    
    private func databaseExists() -> Bool {
        
        let fileUrl = Realm.Configuration.defaultConfiguration.fileURL!
        
        return FileManager.default.fileExists(atPath: fileUrl.absoluteString)
    }
    
    public init(databaseFilename: String) {
        self.databaseFilename = databaseFilename
        
        setupSharedRealm()
    }
    
    private func handleError(error: Error) {
        
        print("Realm() generated error: \(error)")
    }
    
    // MARK: - Utility
    
    public func countAllOfType(type: ManagedBaseModel.Type) -> Int {
        do {
            let realm = try Realm()
            
            return realm.objects(type).count
        } catch let error {
            handleError(error: error)
        }
        
        return 0
    }
    
    public func findFirstOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, predicate: NSPredicate) -> T? {
        
        return findFirstOfType(type: type, predicate: predicate, sortDescriptors: nil)
    }
    
    public func findFirstOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> T? {
        
        if let objects = findAllOfType(type: type, predicate: predicate, sortDescriptors: sortDescriptors) {
            return objects.first as? T
        }
        
        return nil
    }
    
    public func findAllOfType<T: ManagedBaseModel>(type: T.Type) -> Results<T>? {
        
        return findAllOfType(type: type, predicate: nil, sortDescriptors: nil)
    }
    
    public func findAllOfType<T: ManagedBaseModel>(type: T.Type, sortDescriptors: [SortDescriptor]) -> Results<T>? {
        
        return findAllOfType(type: type, predicate: nil, sortDescriptors: sortDescriptors)
    }
    
    public func findAllOfTypeWithSort<T: ManagedBaseModel>(type: T.Type, predicate: NSPredicate, sortDescriptors: [SortDescriptor]) -> Results<T>? {
        
        return findAllOfType(type: type, predicate: predicate, sortDescriptors: sortDescriptors)
    }
    
    public func findAllOfType<T: ManagedBaseModel>(type: T.Type, predicate: NSPredicate) -> Results<T>? {
        
        return findAllOfType(type: type, predicate: predicate, sortDescriptors: nil)
    }
    
    public func findAllOfType<T: ManagedBaseModel>(type: T.Type, predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> Results<T>? {
        
        do {
            let realm = try Realm()
            
            var objects = realm.objects(type)
            
            if nil != predicate {
                objects = objects.filter(predicate!)
            }
            
            if nil != sortDescriptors {
                objects = objects.sorted(by: sortDescriptors!)
            }
            
            return objects
        } catch let error {
            handleError(error: error)
        }
        
        return nil
    }
    
    public func findAllOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, range: NSRange) -> [T]? {
        
        return findAllOfType(type: type, range: range, predicate: nil, sortDescriptors: nil)
    }
    
    public func findAllOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, range: NSRange, predicate: NSPredicate?, sortDescriptors: [SortDescriptor]?) -> [T]? {
        
        if let objects = findAllOfType(type: type, predicate: predicate, sortDescriptors: sortDescriptors) {
            var slice: [T] = []
            
            for idx in range.location ..< min(range.end, objects.count - 1) {
                slice.append(objects[idx] as! T)
            }
            
            return slice
        }
        
        return nil
    }
    
    public func persistOrUpdate(entities: [ManagedBaseModel]) {
        
        do {
            let realm = try Realm()
            
            // batch the transactions for performance
            for slice in entities.slicesOfSize(sliceSize: sliceSize) {
                try realm.write({ () -> Void in
                    realm.add(slice, update: false)
                })
            }
            
        } catch let error {
            handleError(error: error)
        }

    }
    
    func deleteObject(object: Object) {
        do {
            let realm = try Realm()
            
            try! realm.write({
                realm.delete(object)
            })
        } catch let error {
            handleError(error: error)
        }
        
    }
    
    func deleteObjects(objects: [Object]) {
        do {
            let realm = try Realm()
            
            try! realm.write({
                realm.delete(objects)
            })
        } catch let error {
            handleError(error: error)
        }
    }

    
}
