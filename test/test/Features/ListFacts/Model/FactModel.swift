//
//  ListFactsModel.swift
//  test
//
//  Created by Aline Gomes on 11/05/21.
//

import Foundation
import UIKit

struct FactModel {
    var fact: String
    var tag: String
    var fontSize: CGFloat {
        return fact.count >= 80 ? 20 : 30
    }
    var url: String
    
    init(fact: String, tag: String, url: String) {
        self.fact = fact
        self.tag = tag.count == 0 ? "UNCATEGORIZED" : tag
        self.url = url
    }
}
