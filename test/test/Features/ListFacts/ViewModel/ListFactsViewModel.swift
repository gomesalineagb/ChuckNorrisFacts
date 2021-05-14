//
//  ListFactsViewModel.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

public class ListFactsViewModel {
    var chuckNorrisProvider: ChuckNorrisProvider?
    var listFactsView: ListFactsViewControllerProtocol?
    var coordinator: ListFactsCoordinatorProtocol?
    var cacheProvider: CacheProvider?
    
    private var facts: [Fact] {
        get {
            return self.cacheProvider?.getFacts() ?? []
        }
        set {
            
        }
     }
    
    init(cache: CacheProvider) {
        self.cacheProvider = cache
    }

}

extension ListFactsViewModel: ListFactsViewModelProtocol {
    func search() {
        self.coordinator?.gotoSearchScreen()
    }
    
    func fetchRandom() {
        //start loading
        self.chuckNorrisProvider?.fetchRandom { [weak self] (result) in
            switch result {
            case .success(let fact):
                //stop loading
                self?.cacheProvider?.setFacts(facts: [fact])
                self?.listFactsView?.reloadData()
            case .failure(let error):
                //stop loading
                print("\n\n\n\n\n\n\n erro API: ",error,"\n\n\n\n\n\n")
            }
        }
    }
    
    func getFact(for indexPath: IndexPath) -> FactModel {
        let fact = FactModel(fact: facts[indexPath.row].value,
                             tag: facts[indexPath.row].categories.first ?? "",
                             url: facts[indexPath.row].url)
        return fact
    }
    
    func numberOfRowsInSection() -> Int {
        return facts.count
    }
}
