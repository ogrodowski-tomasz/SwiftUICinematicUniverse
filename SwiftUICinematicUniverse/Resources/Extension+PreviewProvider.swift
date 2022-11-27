//
//  Extension+PreviewProvider.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

extension PreviewProvider {
    static var previewCharacters: [Character] {
        return try! StaticJsonMapper.fetch(filename: "StaticCharactersData", decodeToType: CharacterApiWrapper.self).data.results
    }
}
