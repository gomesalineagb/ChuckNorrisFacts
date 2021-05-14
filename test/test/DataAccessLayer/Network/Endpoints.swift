//
//  Endpoints.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

enum Endpoints {
    private static var baseURL = "https://api.chucknorris.io/jokes"
    
    case search(String)
    case categories
    case category(String)
    case random
    
    private var fullPath: String {
        switch self {
        case .search(let term):
            return Endpoints.baseURL + "/search?query=\(term)"
        case .categories:
            return Endpoints.baseURL + "/categories"
        case .category(let category):
            return Endpoints.baseURL + "/random?category=\(category)"
        case .random:
            return Endpoints.baseURL + "/random"
        }
    }
    
    var url: URL {
        guard let url = URL(string: fullPath) else {
            preconditionFailure("The url used in \(Endpoints.self) is not valid")
        }
        return url
    }
}
