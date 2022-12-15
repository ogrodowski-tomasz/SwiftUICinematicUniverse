//
//  ComicsDataService.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

class ComicsDataService: ObservableObject {
    
    @Published private(set) var comics = [Comic]()
    private(set) var allComics = 0
    
    let networkingManager: NetworkingManagerable
    let characterId: Int
    
    init(characterId: Int, networkingManager: NetworkingManagerable = NetworkingManager()) {
        self.characterId = characterId
        self.networkingManager = networkingManager
        
        publishComics()
    }
    
    private func publishComics() {
        networkingManager.fetch(endpoint: .comics(forCharacterId: characterId), decodeToType: ComicApiWrapper.self) { [weak self] result in
            switch result {
            case .success(let apiResponse):
                self?.allComics = apiResponse.data.total
                self?.comics = apiResponse.data.results
            case .failure(let error):
                print("DEBUG: Error comics ", error)
            }
        }
    }
    
}
