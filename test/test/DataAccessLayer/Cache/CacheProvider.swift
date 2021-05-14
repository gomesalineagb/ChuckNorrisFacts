//
//  CacheProvider.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation

public protocol CacheProvider {
    func getPastSearches() -> [String]
    func getFacts() -> [Fact]
    func getCategories() -> [String]
    func isFirstLaunch() -> Bool
    
    func addNewSearch(newSearch: String)
    func setFacts(facts: [Fact])
    func setCategories(categories: [String])
}
