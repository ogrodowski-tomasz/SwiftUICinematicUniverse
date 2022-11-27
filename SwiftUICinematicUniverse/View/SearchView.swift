//
//  SearchView.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                    TextField("Search for character...", text: $viewModel.textFieldText)
                }
                .foregroundColor(.white)
                .padding()
                .background {
                    Color.gray.opacity(0.2)
                }
                .padding(.bottom, 40)
                
                if viewModel.searchCharacters.isEmpty {
                    Spacer()
                    EmptySearchView()
                    Spacer()
                } else if viewModel.isLoading {
                    Spacer()
                    ProgressView {
                        Text("Fetching data...")
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    Spacer()
                } else {
                    ForEach(viewModel.searchCharacters) { character in
                        NavigationLink(value: character) {
                            CharacterCell(character: character)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .navigationDestination(for: Character.self) { charater in
                CharacterDetailsView(character: charater)
            }
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .preferredColorScheme(.dark)
    }
}
