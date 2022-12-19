//
//  CharactersListView.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct CharactersListView: View {
    let characters: [Character]
    
    let onLastCharacterShow: () -> Void
    
    var body: some View {
        NavigationStack {
            LazyVStack {
                ForEach(characters) { character in
                    NavigationLink(value: character) {
                        CharacterCell(character: character)
                            .onAppear {
                                if character.id == characters.last?.id {
                                    print("DEBUG: Last character appeared!")
                                    onLastCharacterShow()
                                }
                            }
                    }
                }
                ProgressView()
            }
            .navigationDestination(for: Character.self) { character in
                CharacterDetailsView(character: character)
            }
        }
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(characters: previewCharacters, onLastCharacterShow: {})
            .preferredColorScheme(.dark)
    }
}
