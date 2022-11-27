//
//  CharactersListView.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct CharactersListView: View {
    let characters: [Character]
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(characters) { character in
                    NavigationLink(value: character) {
                        CharacterCell(character: character)
                    }
                }
            }
            .navigationDestination(for: Character.self) { character in
                CharacterDetailsView(character: character)
            }
        }
    }
}

//struct CharactersListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharactersListView(characters: [previewCharacters])
//    }
//}
