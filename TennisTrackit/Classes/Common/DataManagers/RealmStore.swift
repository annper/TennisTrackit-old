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
    
    private var databaseFilename: String!
    
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
    
    public init(databaseFilename: String, seedDatabaseFilename: String?) {
        self.databaseFilename = databaseFilename
        
        setupSharedRealm()
    }

    
}
