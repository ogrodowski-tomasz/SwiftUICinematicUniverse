//
//  CharacterCell.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct CharacterCell: View {
    let character: Character
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: character.thumbnail.imagePath)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200, alignment: .center)
            } placeholder: {
                ProgressView()
                    .frame(height: 200, alignment: .center)
            }

            Text(character.name)
                .bold()
                .foregroundColor(.white)
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.thinMaterial)
                }
                .padding()
        }
        .cornerRadius(10)
    }
}
