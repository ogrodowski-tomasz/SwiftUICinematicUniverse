//
//  NetworkingManager.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

enum NetworkingError: Error {
    case badUrl
    case decoding
    case serverError
}

protocol NetworkingManagerable {
    func fetch<T: Codable>(endpoint: Endpoint, decodeToType type: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void)
}

struct NetworkingManager: NetworkingManagerable {
    
    func fetch<T: Codable>(endpoint: Endpoint, decodeToType type: T.Type, completion: @escaping (Result<T, NetworkingError>) -> Void) {
        guard let url = endpoint.url else {
            completion(.failure(.badUrl))
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            if let error {
                print("DEBUG: Error fetching: \(error)")
                completion(.failure(.serverError))
                return
            } else if let data {
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                } catch {
                    print("DEBUG: error decoding: \(error)")
                    completion(.failure(.decoding))
                    return
                }
            }
            
        }
        task.resume()
    }
    
}
