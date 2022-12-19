//
//  CharacterDataService.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

class CharacterDataService: ObservableObject {
    
    @Published private(set) var characters = [Character]()
    var page = 0 {
        didSet {
            if !(page == oldValue) {
                fetchCharacters()
            }
        }
    }
    
    let networkingManager: NetworkingManagerable
    
    init(networkingManager: NetworkingManagerable = NetworkingManager()) {
        self.networkingManager = networkingManager
        fetchCharacters()
    }
    
    private func fetchCharacters() {
        networkingManager.fetch(endpoint: .characters(page: page), decodeToType: CharacterApiWrapper.self) { [weak self] result in
            switch result {
            case .success(let marvelDataWrapper):
                self?.characters.append(contentsOf: marvelDataWrapper.data.results)
            case .failure(let error):
                print("DEBUG: Error! ", error)
            }
        }
    }
    
}
