//
//  ChuckNorrisDataManager.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

struct ChuckNorrisDataManager: ChuckNorrisProvider {
    
    private var network: HTTPRequest
    
    init(network: HTTPRequest = HTTPRequest()) {
        self.network = network
    }
    
    func search(with term: String, completion: @escaping (Result<ListFacts, Error>) -> Void) {
        let url = Endpoints.search(term).url
        
        network.get(url: url, completion: completion)
    }
    
    func fetchByCategory(category: String, completion: @escaping (Result<Fact, Error>) -> Void) {
        let url = Endpoints.category(category).url
        
        network.get(url: url, completion: completion)
    }
    
    func fetchCategories(completion: @escaping (Result<[String], Error>) -> Void) {
        let url = Endpoints.categories.url
        
        network.get(url: url, completion: completion)
    }
    
    func fetchRandom(completion: @escaping (Result<Fact, Error>) -> Void) {
        let url = Endpoints.random.url
        
        network.get(url: url, completion: completion)
    }
}
