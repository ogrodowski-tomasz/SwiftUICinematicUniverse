//
//  CharacterDataService.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

class CharacterDataService: ObservableObject {
    
    @Published private(set) var characters = [Character]()
    
    
    let networkingManager: NetworkingManagerable
    
    init(networkingManager: NetworkingManagerable = NetworkingManager()) {
        self.networkingManager = networkingManager
        fetchCharacters()
    }
    
    
    private func fetchCharacters() {
//        networkingManager.fetch(endpoint: .characters, decodeToType: CharacterApiWrapper.self) { [weak self] result in
//            switch result {
//            case .success(let marvelDataWrapper):
//                self?.characters = marvelDataWrapper.data.results
//            case .failure(let error):
//                print("DEBUG: Error! ", error)
//            }
//        }
        
        do {
            let result = try StaticJsonMapper.fetch(filename: "StaticCharactersData", decodeToType: CharacterApiWrapper.self)
            self.characters = result.data.results
        } catch {
            print("Error! \(error)")
        }
        
    }
    
}
