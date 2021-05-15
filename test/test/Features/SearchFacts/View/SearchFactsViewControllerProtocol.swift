//
//  SearchFactsViewControllerProtocol.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation

protocol SearchFactsViewControllerProtocol: AnyObject {
    func search(category: String)
    func search(term: String)
}
