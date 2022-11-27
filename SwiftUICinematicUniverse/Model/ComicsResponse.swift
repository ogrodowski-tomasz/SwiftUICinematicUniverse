//
//  ComicsResponse.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

struct ComicApiWrapper: Codable {
    let data: ComicsContainer
}

struct ComicsContainer: Codable {
    let total: Int
    let results: [Comic]
}

struct Comic: Codable, Identifiable {
    let id: Int
    let title: String
    let thumbnail: Thumbnail
}
