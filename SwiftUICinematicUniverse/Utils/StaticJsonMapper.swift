//
//  StaticJsonMapper.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

enum MapperError: Error {
    case noData
    case decoding(Error)
}

struct StaticJsonMapper {
    static func fetch<T:Codable>(filename: String, decodeToType type: T.Type) throws -> T {
        guard !filename.isEmpty,
              let path = Bundle.main.path(forResource: filename, ofType: "json"),
              let data = FileManager.default.contents(atPath: path)
        else {
            throw MapperError.noData
        }
        let decoder = JSONDecoder()
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw MapperError.decoding(error)
        }
    }
}
