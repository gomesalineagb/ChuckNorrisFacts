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
    private var facts: [Fact] = []

}

extension ListFactsViewModel: ListFactsViewModelProtocol {
    func search(with term: String) {
        
        self.chuckNorrisProvider?.search(with: term) { [weak self] (result) in
            switch result {
            case .success(let ListFacts):
                self?.facts = ListFacts.result
                self?.listFactsView?.reloadData()
            case .failure(let error):
                print("\n\n\n\n\n\n\n erro API: ",error,"\n\n\n\n\n\n")
            }
        }
        
    }
    
    func fetchByCategory(category: String) {
        
        self.chuckNorrisProvider?.fetchByCategory(category: category) { [weak self] (result) in
            switch result {
            case .success(let fact):
                self?.facts.removeAll()
                self?.facts.append(fact)
                self?.listFactsView?.reloadData()
            case .failure(let error):
                print("\n\n\n\n\n\n\n erro API: ",error,"\n\n\n\n\n\n")
            }
        }
        
    }
    
    func fetchCategories() { //precisa guardar no cache
        
//        self.chuckNorrisProvider?.fetchCategories { [weak self]  (result) in
//            switch result {
//            case .success(let categories):
//                
//                
//
//            case .failure(let error):
//                print("\n\n\n\n\n\n\n erro API: ",error,"\n\n\n\n\n\n")
//            }
//        }
        
    }
    
    func fetchRandom() {
        self.chuckNorrisProvider?.fetchRandom { [weak self] (result) in
            switch result {
            case .success(let fact):
                self?.facts.removeAll()
                self?.facts.append(fact)
                self?.listFactsView?.reloadData()
            case .failure(let error):
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
