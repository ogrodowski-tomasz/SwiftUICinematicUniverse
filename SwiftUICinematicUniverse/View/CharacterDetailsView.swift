//
//  CharacterDetailsView.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct CharacterDetailsView: View {
    let character: Character
    
    @StateObject private var viewModel: CharacterDetailsViewModel
    
    init(character: Character) {
        self.character = character
        self._viewModel = StateObject(wrappedValue: CharacterDetailsViewModel(character: character))
        print("DEBUG: initing detail view for \(character.name)")
    }
    
    @State private var showFullDesctiption = false
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: character.thumbnail.imagePath)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .blur(radius: 80)
                    .ignoresSafeArea()
            } placeholder: {
                ProgressView()
            }
            
            ScrollView {
                VStack(spacing: 10) {
                    AsyncImage(url: URL(string: character.thumbnail.imagePath)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 250)
                    } placeholder: {
                        ProgressView()
                    }
                    .cornerRadius(10)

                    Text(character.name)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text(character.description.isEmpty ? "No description provided" : character.description)
                            .multilineTextAlignment(.center)
                            .lineLimit(showFullDesctiption ? nil : 2)
                            .padding()
                            .background {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.thinMaterial)
                            }
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showFullDesctiption.toggle()
                                }
                            }
                    
                    
                    if viewModel.isLoading {
                        ProgressView {
                            Text("Loading data...")
                                .foregroundColor(.secondary)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .padding(.top)
                    } else {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("Comics with \(character.name) (\(viewModel.numberOfComics))")
                                .font(.headline)
                                .fontWeight(.semibold)
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack {
                                    ForEach(viewModel.comics) { comic in
                                        ComicCardView(comic: comic)
                                            .onAppear {
                                                if comic.id == viewModel.comics.last?.id {
                                                    viewModel.fetchNextSetOfComics()
                                                }
                                            }
                                    }
                                    ProgressView()
                                }
                            }
                        }
                        .frame(height: 300)
                        .padding(.top)
                    }
                }
                .padding(.horizontal)
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
    }
}

struct ComicCardView: View {
    let comic: Comic
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            AsyncImage(url: URL(string: comic.thumbnail.imagePath)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Text(comic.title)
                .lineLimit(2)
                .font(.subheadline)
            
        }
        .frame(width: 155)
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailsView(character: previewCharacters[10])
    }
}
