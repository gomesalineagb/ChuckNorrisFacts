//
//  ListFactsViewModelProtocol.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

protocol ListFactsViewModelProtocol {
    func search(with term: String)
    func fetchByCategory(category: String)
    func fetchCategories()
    func fetchRandom()
    func getFact(for indexPath: IndexPath) -> FactModel
    func numberOfRowsInSection() -> Int
}
