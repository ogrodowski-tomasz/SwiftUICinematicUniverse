//
//  CharactersResponse.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

struct CharacterApiWrapper: Codable {
    let data: CharactersContainer
}

struct CharactersContainer: Codable {
    let total: Int
    let results: [Character]
}

struct Character: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
}

struct Thumbnail: Codable, Hashable {
    let path: String
    let `extension`: String
    
    var imagePath: String {
        let securePath = path.replacingOccurrences(of: "http", with: "https")
        return securePath + "." + `extension`
    }
}
