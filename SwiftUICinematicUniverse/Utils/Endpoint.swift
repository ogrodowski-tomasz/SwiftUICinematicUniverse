//
//  Endpoint.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

enum Endpoint {
    case characters(page: Int)
    case comics(forCharacterId: Int, page: Int)
    case searchCharacters(withName: String)
}

extension Endpoint {
    var host: String { "gateway.marvel.com" }
    var path: String {
        switch self {
        case .characters, .searchCharacters: return "/v1/public/characters"
        case .comics(let id, _): return "/v1/public/characters/\(id)/comics"
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
        if case .comics(_, let page) = self {
            urlComponents.queryItems?.append(.init(name: "offset", value: "\(page * 20)"))
        }
        if case .characters(let page) = self {
            urlComponents.queryItems?.append(.init(name: "offset", value: "\(page * 20)"))
        }
        if case .searchCharacters(let name) = self {
            urlComponents.queryItems?.append(URLQueryItem(name: "nameStartsWith", value: name))
        }
        return urlComponents.url
    }
}

