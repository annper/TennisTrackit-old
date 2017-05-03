//
//  Constants.swift
//  TennisTrackit
//
//  Created by Annie on 02/05/2017.
//  Copyright © 2017 Dogfish. All rights reserved.
//

import Foundation

public enum Environment: String {
    
    private static let  environmentUserDefaultsKey = "environmentUserDefaultsKey"
    
    case Development = "development"
    case Production = "production"
    
    public static func determineEnvironmentWith(processInfo: ProcessInfo) -> Environment? {
        
        let candidate = candidateWith(processInfo: processInfo)
        
        if true == candidate?.contains("development") {
            return .Development
        } else if true == candidate?.contains("production") {
            return .Production
        } else {
            return .Development
        }
        
    }
    
    private static func candidateWith(processInfo: ProcessInfo) -> String? {
        if let candidate = processInfo.environment["environment"] {
            let userDefaults = UserDefaults.standard
            
            userDefaults.set(candidate, forKey: environmentUserDefaultsKey)
            
            return candidate
        } else {
            let userDefaults = UserDefaults.standard
            let candidate = userDefaults.object(forKey: environmentUserDefaultsKey) as? String
            
            return candidate
        }
    }
}

public class Constants {
    
    public static var sharedInstance: Constants!
    
    private var environment: Environment
    lazy private var plistValues: NSDictionary = {
        
        if let path = Bundle.main.path(forResource: "environment", ofType: "plist") {
            return NSDictionary.init(contentsOfFile: path)!
        }
        assertionFailure("unable to load environment.plist")
        
        return NSDictionary()
    }()
   
    
    // MARK: - Constants
    
    private func plistValueForKey(key: String) -> AnyObject? {
        return plistValues.value(forKeyPath: environment.rawValue + "." + key) as AnyObject?
    }
    
    public init(environment: Environment) {
        self.environment = environment
    }
    
    public var UserGoals: [[String: Any]]? {
        get {
            let defaults = UserDefaults.standard
            
            if let goals = defaults.value(forKey: "goals") as? [[String: Any]] {
                return goals
            }
            
            return nil
        }
    }
}
