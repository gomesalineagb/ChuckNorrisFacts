//
//  RequestError.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

public enum RequestError: Error {
    case nilURL
    case badRequest
    case failedDecoding
    case failedEncoding
    case noData
    case invalidEndpoint
    case invalidResponse
}
