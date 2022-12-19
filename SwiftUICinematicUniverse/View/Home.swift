//
//  Home.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct Home: View {
    
    @StateObject private var viewModel = HomeViewModel()
        
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                ScrollView {
                    CharactersListView(characters: viewModel.characters) {
                        viewModel.fetchNextSetOfCharacters()
                    }
                }
            }
            .navigationTitle("Home")
        }
        .preferredColorScheme(.dark)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
