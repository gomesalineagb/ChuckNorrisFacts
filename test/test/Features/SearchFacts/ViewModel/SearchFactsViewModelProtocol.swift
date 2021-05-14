//
//  SearchFactsViewModelProtocol.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation

protocol SearchFactsViewModelProtocol {
    func search(with term: String)
    func fetchByCategory(category: String)
    func getCategoriesRandom(count: Int) -> [String]
    func numberOfRowsInSection() -> Int
//    func numberOfSections() -> Int
}
