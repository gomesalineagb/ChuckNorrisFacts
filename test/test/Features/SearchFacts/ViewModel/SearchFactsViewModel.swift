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
    private var categories: [String] {
        get {
            return self.cacheProvider?.getCategories() ?? []
        }
        set {}
    }
    private var pastSearches: [String] {
        get {
            return self.cacheProvider?.getPastSearches() ?? []
        }
        set {}
    }
    
    init() {
        
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
    
    func getCategoriesRandom(count: Int) -> [String] {
        return []
    }
    
    func numberOfRowsInSection() -> Int {
        return 0
    }
}
