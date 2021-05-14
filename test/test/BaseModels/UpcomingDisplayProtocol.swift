//
//  UpcomingDisplayProtocol.swift
//  test
//
//  Created by Aline Gomes on 14/05/21.
//

import Foundation

public protocol UpcomingDisplayProtocol {
    var type: UpcomingDisplayType { get set }
}

public enum UpcomingDisplayType {
    case tags
    case suggestions
}
