//
//  CacheDataManager.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation

public class CacheDataManager: CacheProvider {
    
    let userDefault = UserDefaults.standard
    
    public func getPastSearches() -> [String] {
        if let objects = UserDefaults.standard.stringArray(forKey: Constants.kKeyPastSearchesUserDefaults) {
            return objects
        }
        return []
    }
    
    public func getFacts() -> [Fact] {
        if let objects = userDefault.value(forKey: Constants.kKeyFactsUserDefaults) as? Data {
            let decoder = JSONDecoder()
            if let objectsDecoded = try? decoder.decode(Array.self, from: objects) as [Fact] {
                return objectsDecoded
            }
        }
        return []
    }
    
    public func getCategories() -> [String] {
        if let objects = UserDefaults.standard.stringArray(forKey: Constants.kKeyCategoriesUSerDefaults) {
            return objects
        }
        return []
    }
    
    public func isFirstLaunch() -> Bool {
        let firstLaunch = userDefault.bool(forKey: Constants.kKeyFirstLaunchUserDefaults)
                
        if !firstLaunch{
            userDefault.setValue(true, forKey: Constants.kKeyFirstLaunchUserDefaults)
            
        }
        return firstLaunch
    }
    
    public func addNewSearch(newSearch: String) {
        if let searches = userDefault.stringArray(forKey: Constants.kKeyPastSearchesUserDefaults) {
            
            if !searches.contains(newSearch){
                userDefault.set([newSearch], forKey: Constants.kKeyPastSearchesUserDefaults)
            }
        } else {
            userDefault.set([newSearch], forKey: Constants.kKeyPastSearchesUserDefaults)
        }
    }
    
    public func setFacts(facts: [Fact]) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(facts){
            userDefault.set(encoded, forKey: Constants.kKeyFactsUserDefaults)
        }
    }
    
    public func setCategories(categories: [String]) {
        userDefault.set(categories, forKey: Constants.kKeyCategoriesUSerDefaults)
    }
}
