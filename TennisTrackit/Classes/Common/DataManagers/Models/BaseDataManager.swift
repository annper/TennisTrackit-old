//
//  BaseDataManager.swift
//  TennisTrackit
//
//  Created by Annie on 15/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation
import RealmSwift

public class BaseDataManager {
    
    internal var realmStore: RealmStore?
    
    // MARK: - BaseDataManager
    
    public init(realmStore: RealmStore = RealmStore.sharedStore) {
        self.realmStore = realmStore
    }
    
    internal func persistOrUpdateManagedObject<T: ManagedBaseModel>(objects: [T]) {
        
        realmStore!.persistOrUpdate(entities: objects)
    }
    
    internal func allManagedObjectsOfType<T: ManagedBaseModel>(type: T.Type) -> Results<T>? {
        
        return realmStore!.findAllOfType(type: type)
    }
    
    internal func allManagedObjectsOfType<T: ManagedBaseModel>(type: T.Type, sortDescriptors: [SortDescriptor]) -> Results<T>? {
        
        return realmStore!.findAllOfType(type: type, sortDescriptors: sortDescriptors)
    }
    
    internal func managedObjectsOfType<T: ManagedBaseModel>(type: T.Type, range: NSRange) -> [T]? {
        
        return realmStore!.findAllOfType(type: type, range: range)
    }
    
    internal func managedObjectsOfType<T: ManagedBaseModel>(type: T.Type, predicate: NSPredicate) -> Results<T>? {
        
        return realmStore!.findAllOfType(type: type, predicate: predicate)
    }
    
    internal func managedObjectsOfType<T: ManagedBaseModel>(type: T.Type, predicate: NSPredicate, sortDescrpitors: [SortDescriptor]) -> Results<T>? {
        
        return realmStore!.findAllOfType(type: type, predicate: predicate, sortDescriptors: sortDescrpitors)
    }
    
    internal func managedObjectsOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, range: NSRange, predicate: NSPredicate?, sortDescrpitors: [SortDescriptor]?) -> [T]? {
        
        return realmStore!.findAllOfType(type: type, range: range, predicate: predicate, sortDescriptors: sortDescrpitors)
    }
    
    internal func managedObjectOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, id: String) -> T? {
        
        let predicate = NSPredicate(format: "id = %@", id)
        
        return realmStore?.findFirstOfType(type: type, predicate: predicate)
    }
    
    internal func managedObjectsOfType<T: ManagedBaseModel>(type: T.Type, ids: [Int]) -> Results<T>? {
        
        let predicate = NSPredicate(format: "id IN %@", ids)
        
        return realmStore!.findAllOfType(type: type, predicate: predicate)
    }
    
    internal func managedObjectOfType<T: ManagedBaseModel>(type: ManagedBaseModel.Type, predicate: NSPredicate) -> T? {
        
        return realmStore?.findFirstOfType(type: type, predicate: predicate)
    }
    
    internal func deleteManagedObject<T: ManagedBaseModel>(objects: [T]) {
        realmStore!.deleteObjects(objects: objects)
    }
}
