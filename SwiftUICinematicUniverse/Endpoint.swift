//
//  Endpoint.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

enum Endpoint {
    case characters
    case comics(forCharacterId: Int)
    case searchCharacters(withName: String)
}

extension Endpoint {
    var host: String { "gateway.marvel.com" }
    var path: String {
        switch self {
        case .characters, .searchCharacters: return "/v1/public/characters"
        case .comics(let id): return "/v1/public/characters/\(id)/comics"
        }
    }
    
    var url: URL? {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = host
        urlComponents.path = path
        
        AuthorizationManager().createHash { queryItems in
            urlComponents.queryItems = queryItems
        }
        
        if case .searchCharacters(let name) = self {
            urlComponents.queryItems?.append(URLQueryItem(name: "nameStartsWith", value: name))
        }
        
//        print("URL: ", urlComponents.url as Any)
        return urlComponents.url
    }
}

