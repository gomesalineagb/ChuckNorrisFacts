//
//  ChuckNorrisProvider.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

public protocol ChuckNorrisProvider {
    func search(with term: String, completion: @escaping(Result<ListFacts,Error>) -> Void)
    func fetchByCategory(category: String, completion: @escaping(Result<Fact,Error>) -> Void)
    func fetchCategories(completion: @escaping(Result<[String],Error>) -> Void)
    func fetchRandom(completion: @escaping(Result<Fact,Error>) -> Void)
}

public struct ListFacts: Codable {
    var result: [Fact]
}
