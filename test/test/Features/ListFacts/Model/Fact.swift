//
//  Fact.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

public struct Fact: Codable {
    
    var icon_url:   String
    var url:        String
    var value:      String
    var categories: [String]
}

extension Fact: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.url == rhs.url
    }
    
    public static func != (lhs: Self, rhs: Self) -> Bool {
        return lhs.url != rhs.url
    }
}
