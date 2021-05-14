//
//  HTTPRequest.swift
//  test
//
//  Created by Aline Gomes on 12/05/21.
//

import Foundation

public struct HTTPRequest {
    
    func get <T:Codable> (url: URL, completion: @escaping (Result<T, Error>) -> Void) {
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data,response,error)  in
        
            if let error = error {
                completion(.failure(error))
                return
            }
            if let response = response as? HTTPURLResponse,
               (200...299).contains(response.statusCode),
               let data = data {
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(T.self, from: data)
                    completion(.success(decodedData))
                    return
                } catch {
                    completion(.failure(RequestError.failedDecoding))
                    return
                }
            }
            completion(.failure(RequestError.invalidResponse))
            return
        }.resume()
    }
}
