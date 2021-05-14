//
//  SearchFactsViewModel.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation
import UIKit

public class SearchFactsViewModel {
    var chuckNorrisProvider: ChuckNorrisProvider?
    var searchFactsView: SearchFactsViewControllerProtocol?
    var coordinator: SearchFactsCoordinatorProtocol?
    var cacheProvider: CacheProvider?
    private var categories: [String] = []
    private var pastSearches: [String] = []
    
    private var dataProperty: [UpcomingDisplayProtocol] {
        get {
            return [ArrayString(type: .tags, values: categories), ArrayString(type: .suggestions, values: pastSearches)]
        }
    }
    
    init(cache: CacheProvider) {
        self.cacheProvider = cache
        
        self.categories = self.getCategoriesRandom(count: 8)
        self.pastSearches = self.cacheProvider?.getPastSearches() ?? []
    }
    
    func getCategoriesRandom(count: Int) -> [String] {
        if let objects = self.cacheProvider?.getCategories(){
        
            var newObjects: [String] = []
            var i = 0
            
            while i < count {
                if let randomElement = objects.randomElement(){
                    if !newObjects.contains(randomElement) {
                        newObjects.append(randomElement)
                        i += 1
                    }
                }
            }
            return newObjects
        }
        
        return []
    }
}

extension SearchFactsViewModel: SearchFactsViewModelProtocol {
    func search(with term: String) {
        //start loading
        self.chuckNorrisProvider?.search(with: term) { [weak self] (result) in
            switch result {
            case .success(let listFacts):
                //stop loading
                self?.cacheProvider?.addNewSearch(newSearch: term)
                self?.cacheProvider?.setFacts(facts: listFacts.result)
                self?.coordinator?.gotoListFactsScreen()
            case .failure(let error):
                //stop loading
                print("\n\n\n\n\n\n\n erro API: ",error,"\n\n\n\n\n\n")
            }
        }
    }
    
    func fetchByCategory(category: String) {
        //start loading
        self.chuckNorrisProvider?.fetchByCategory(category: category) { [weak self] (result) in
            switch result {
            case .success(let fact):
                //stop loading
                self?.cacheProvider?.setFacts(facts: [fact])
                self?.coordinator?.gotoListFactsScreen()
            case .failure(let error):
                //stop loading
                print("\n\n\n\n\n\n\n erro API: ",error,"\n\n\n\n\n\n")
            }
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return dataProperty.count
    }
    
    func getDataProperty(indexPath: IndexPath) -> UpcomingDisplayProtocol {
        return dataProperty[indexPath.row]
    }
}
