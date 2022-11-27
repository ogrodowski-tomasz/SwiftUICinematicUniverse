//
//  SearchService.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import Foundation

class SearchService: ObservableObject {
    @Published private(set) var characters = [Character]()
    private(set) var resultCount = 0
    
    let networkingManager: NetworkingManagerable
    
    init(networkingManager: NetworkingManagerable = NetworkingManager()) {
        self.networkingManager = networkingManager
    }
    
    func performSearch(forName name: String) {
        networkingManager.fetch(endpoint: .searchCharacters(withName: name), decodeToType: CharacterApiWrapper.self) { [weak self] result in
            switch result {
            case .success(let apiResponse):
                self?.characters = apiResponse.data.results
                self?.resultCount = apiResponse.data.total
            case .failure(let error):
                print("DEBUG: Error! ", error)
            }
        }
    }
}
