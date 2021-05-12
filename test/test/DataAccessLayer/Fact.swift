//
//  Fact.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

public struct Fact {
    
    var icon_url:   String
    var url:        String
    var value:      String
    var categories: [String]
    
    enum FactCodingKeys: String, CodingKey {
        case icon_url
        case url
        case value
        case categories
    }
}

extension Fact: Codable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: FactCodingKeys.self)
        icon_url = try container.decode(String.self, forKey: .icon_url)
        url = try container.decode(String.self, forKey: .url)
        value = try container.decode(String.self, forKey: .value)
        categories = try container.decode([String].self, forKey: .categories)
    }
}
