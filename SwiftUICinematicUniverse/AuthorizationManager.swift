//
//  AuthorizationManager.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import CommonCrypto
import CryptoKit
import Foundation


struct AuthorizationManager {
    
    func createHash(completion: @escaping ([URLQueryItem]) -> Void) {
        let timestamp = Date().timeIntervalSince1970
//        print("DEBUG: Timestamp -> \(timestamp)")
//        print("DEBUG: Public api key -> \(PUBLIC_API_KEY)")
//        print("DEBUG: private api key -> \(PRIVATE_API_KEY)")
        let stringBeforeHashing = "\(timestamp)\(PRIVATE_API_KEY)\(PUBLIC_API_KEY)"
//        print("DEBUG: Before hashing -> \(stringBeforeHashing)")
        let md5 = stringBeforeHashing.MD5
        var queryItems = [URLQueryItem]()
        queryItems.append(.init(name: "ts", value: String(timestamp)))
        queryItems.append(.init(name: "apikey", value: PUBLIC_API_KEY))
        queryItems.append(.init(name: "hash", value: md5))
        completion(queryItems)
    }
}


